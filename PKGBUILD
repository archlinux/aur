# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=hidapitester-git
_pkgname=hidapitester
pkgver=r76.90e4bae
pkgrel=1
pkgdesc="Simple command-line program to test HIDAPI"
url="https://github.com/todbot/hidapitester"
depends=(systemd-libs hidapi)
makedepends=('git')
conflicts=(hidapitester)
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/todbot/hidapitester.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  make
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/${_pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
