# Maintainer: Natrio <natrio list ru>
pkgname=gimp-plugin-astronomy
pkgver=0.8
pkgrel=1
pkgdesc="Gimp Astronomy Plugins"
arch=('i686' 'x86_64')
url="http://hennigbuam.de/georg/gimp.html"
license=('GPL')
depends=('gimp' 'gsl' 'fftw')
makedepends=('perl-xml-parser')
source=("http://www.hennigbuam.de/georg/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('8396e97e9f369a5139d0102b5f37b620')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LIBS='-lm'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
