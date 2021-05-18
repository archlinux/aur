# vim: set tabstop=2 set shiftwidth=2 set expandtab
# Maintainer: Mariusz Jakoniuk (jarmuszz at tuta dot io)
pkgname=per
pkgver=1.0.2
pkgrel=1
url="https://github.com/jarmuszz/per"
pkgdesc="Simple unix permission viewer and converter"
license=("GPL3")
makedepends=("make" "gzip")
arch=("any")
source=("https://github.com/jarmuszz/per/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("8bf61a2e13fe351047e438f859fbacd0e88e513ae3d5c32d6b20214fc63c358a")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
