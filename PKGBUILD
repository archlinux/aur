# vim: set tabstop=2 set shiftwidth=2 set expandtab
# Maintainer: Mariusz Jakoniuk (jarmuszz at tuta dot io)
pkgname=per
pkgver=1.0.1
pkgrel=0
url="https://github.com/jarmuszz/per"
pkgdesc="Simple unix permission viewer and converter"
license=("GPL3")
makedepends=("make" "gzip")
arch=("any")
source=("https://github.com/jarmuszz/per/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("3a3a44f7aa6e841ea123445233fd289434fc7ed7e10fe644860f1ce85e4aba67")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
