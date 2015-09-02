# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>

pkgname=libinklevel
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for checking the ink level of your printer"
arch=('i686' 'x86_64')
url="http://libinklevel.sourceforge.net/"
license=('GPL')
depends=('libieee1284')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('83464cb23fe46a1d1adbe10f08b247be')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}