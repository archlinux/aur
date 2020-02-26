# Maintainer: Alexandria Pettit <alxpettit@gmail.com>
_pkgname=aur-audit
pkgname="${_pkgname}-git"
pkgver=r2.e7e053c
pkgrel=1
pkgdesc="Audit AUR packages more easily"
arch=('any')
url="https://github.com/alxpettit/${_pkgname}"
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
depends=('bat')
pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
