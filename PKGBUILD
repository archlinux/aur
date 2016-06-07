# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=le-editor
pkgver=1.16.3
pkgrel=1
pkgdesc="A text editor in memorial to Norton Editor with block and binary operations"
arch=('i686' 'x86_64')
url="https://directory.fsf.org/wiki/Le_editor"
license=('GPL3')
depends=('bash' 'ncurses')
source=("http://lav.yar.ru/download/le/le-$pkgver.tar.xz")
md5sums=('a2c51cb160bd6b1b83daad8ba092d4c2')

build() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
