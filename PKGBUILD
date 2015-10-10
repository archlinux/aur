# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>

pkgname=libinklevel
pkgver=0.9.2
pkgrel=1
pkgdesc="A library for checking the ink level of your printer"
arch=('i686' 'x86_64')
url="http://libinklevel.sourceforge.net/"
license=('GPL')
depends=('libieee1284')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d9f61d14afc2025da454a624578b2be8')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}