# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=le-editor
pkgver=1.15.0
pkgrel=1
pkgdesc="A text editor in memorial to Norton Editor with block and binary operations"
arch=('i686' 'x86_64')
url="https://directory.fsf.org/wiki/Le_editor"
license=('GPL3')
depends=('gcc-libs' 'ncurses')
source=("http://fossies.org/linux/misc/${pkgname%-editor}-$pkgver.tar.xz")
md5sums=('f5fe85103a6190bcdc51d2fbb4407388')

build() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
