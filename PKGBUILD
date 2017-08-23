# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=le-editor
pkgver=1.16.5
pkgrel=1
pkgdesc="A text editor in memorial to Norton Editor with block and binary operations"
arch=('i686' 'x86_64')
url="http://lav.yar.ru//"
license=('GPL3')
depends=('bash' 'ncurses')
source=("http://lav.yar.ru/download/le/le-$pkgver.tar.xz")
md5sums=('ff3841f35feafcb6249f322cc3e232ce')

build() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
