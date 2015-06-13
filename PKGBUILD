# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=rnaz
pkgver=2.1
pkgrel=1
pkgdesc="predicting structural noncoding RNAs"
arch=('x86_64' 'i686')
url="http://www.tbi.univie.ac.at/~wash/RNAz/"
license=('custom')
depends=('perl')
source=("http://www.tbi.univie.ac.at/~wash/RNAz/RNAz-$pkgver.tar.gz")
md5sums=('748dec1d1de7e73d7f42290e51c14052')

build() {
  cd "$srcdir/RNAz-$pkgver"

  ./configure --prefix=/usr --disable-static

  make
}

check() {
   cd "$srcdir/RNAz-$pkgver"

   make check
}

package() {
  cd "$srcdir/RNAz-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
