# Submitter: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Maintainer: Ronny Lorenz ("RaumZeit") <ronny@tbi.univie.ac.at>

pkgname=rnaz
pkgver=2.1.1
pkgrel=1
pkgdesc="predicting structural noncoding RNAs"
arch=('x86_64' 'i686')
url="http://www.tbi.univie.ac.at/~wash/RNAz/"
license=('custom')
depends=('perl')
source=("http://www.tbi.univie.ac.at/RNA/packages/source/RNAz-$pkgver.tar.gz")
md5sums=('83f913075d3c1e35d09680d4c2227733')

build() {
  cd $srcdir/RNAz-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/RNAz-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
