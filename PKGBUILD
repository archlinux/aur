# Maintainer: Sick Codes <info at sick dot codes>
# Contributor: Abraham Stolk <https://github.com/stolk>
pkgname=imcat-git
_pkgname=${pkgname%-*}
pkgver=r22.218d975
pkgrel=1
pkgdesc="Preview any size image in a terminal window."
arch=('any')
url="https://github.com/stolk/imcat"
license=('CC0')
provides=(${pkgname})
depends=()
optdepends=()
makedepends=()
source=("git+https://github.com/stolk/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

