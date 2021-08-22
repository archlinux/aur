# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Brian Polier <unknown989@protonmail.com>
_pkgname=iv
pkgname="${_pkgname}-git"
pkgver=r84.625b9ff
pkgrel=2
pkgdesc="A simple yet powerful image viewer"
arch=('any')
url="https://github.com/unknown989/iv.git"
license=('GPL')
depends=('sfml' 'zenity')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
  install -Dm644 "iv.desktop" "${pkgdir}/usr/local/applications/iv.desktop"
  install -Dm644 "LICENSE" "${pkgdir}/usr/local/share/licenses/${_pkgname}/LICENSE"
}
