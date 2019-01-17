# Maintainer: Natrio <natrio list ru>
pkgname=gimp-plugin-astronomy
pkgver=0.10
pkgrel=1
pkgdesc="Gimp Astronomy Plugins"
arch=('i686' 'x86_64')
url="http://hennigbuam.de/georg/gimp.html"
license=('GPL')
depends=('gimp' 'gsl' 'fftw')
makedepends=('perl-xml-parser')
source=("http://www.hennigbuam.de/georg/downloads/$pkgname-$pkgver.tar.bz2"
 'stop-declare-strndup.patch')
md5sums=('5a70dcd8699790497ff45451c9c4071f' SKIP)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
#  patch -p1 -i "$srcdir/stop-declare-strndup.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
#  make LIBS='-lm'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
