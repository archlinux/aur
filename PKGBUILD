# Contributor: Brent Carmer
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>

pkgname=yices
pkgver=2.6.2
pkgrel=1
pkgdesc="The Yices SMT Solver"
arch=('x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
depends=('gmp')
makedepends=('gperf')
source=("http://yices.csl.sri.com/releases/${pkgver}/yices-${pkgver}-src.tar.gz")
sha1sums=('5ea0cd1d49fa17eda970480fa3d09fbb2147d694')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
