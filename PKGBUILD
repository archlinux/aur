# Contributor: Brent Carmer
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>

pkgname=yices
pkgver=2.6.1
pkgrel=1
pkgdesc="The Yices SMT Solver"
arch=('x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
makedepends=('gperf' 'gmp')
source=("http://yices.csl.sri.com/releases/${pkgver}/yices-${pkgver}-src.tar.gz")
sha1sums=('387f20480d38f7e0692260ea187d128cb65b2d07')

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
