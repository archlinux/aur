# Maintainer: hitori <hitori.gm at gmail dot com>
_pkgname=mei-amt-check
pkgname="${_pkgname}-git"
pkgver=r7.7b61ced
pkgrel=1
pkgdesc="Check whether AMT is enabled and provisioned under Linux"
arch=('any')
url="https://github.com/mjg59/${_pkgname}"
license=('GPL2')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make
}

package() {
  install -Dm755 "${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
