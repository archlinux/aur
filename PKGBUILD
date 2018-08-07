# Contributor: Brent Carmer
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>

pkgname=yices
pkgver=2.6.0
pkgrel=1
pkgdesc="The Yices SMT Solver"
arch=('x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
makedepends=('gcc' 'gperf' 'gmp' 'make')
source=("http://yices.csl.sri.com/releases/${pkgver}/yices-${pkgver}-src.tar.gz")
sha1sums=('a53d0293d29d7f71a267b4e680e6214c02132b26')

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
