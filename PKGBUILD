# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>

pkgname=inkblot
pkgver=0.99.9
pkgrel=1
pkgdesc="Inkblot reports on the remaining ink levels in a wide variety of USB and Parallel connected printers."
arch=('i686' 'x86_64')
url="http://www.gnomefiles.org/app.php/Inkblot"
license=('GPL')
depends=('libinklevel' 'libieee1284' 'ink')
makedepends=('libinklevel' 'libieee1284')
source=('http://www.gnomefiles.org/download.php?soft_id=347&where=http%3A%2F%2Fwww.mikegtn.net%2Fpackages%2Finkblot%2Finkblot-0.99.9.tar.gz')
md5sums=('671c85f394ff778ad77d0fe0828d864a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
