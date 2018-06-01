# Contributor: Brent Carmer
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>

pkgname=yices
pkgver=2.5.4
pkgrel=1
pkgdesc="The Yices SMT Solver"
arch=('x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
makedepends=('gcc' 'gperf' 'gmp' 'make')
source=("http://yices.csl.sri.com/releases/2.5.4/yices-${pkgver}-src.tar.gz")
sha1sums=('664e354b6c3ed3d61fbe663e1fc3e00c5faf764e')

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
