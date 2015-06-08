# Maintainer:
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=libghemical
pkgver=3.0.0
pkgrel=2
pkgdesc='Library containing computational chemistry facility of ghemical'
license=('GPL')
arch=('x86_64' 'i686')
url='http://bioinformatics.org/ghemical/libghemical/'
depends=('gcc-libs')
makedepends=('openbabel' 'intltool>=0.40.0')
options=('!libtool')
source=("http://bioinformatics.org/ghemical/download/release20111012/$pkgname-$pkgver.tar.gz")
sha256sums=('db8c3add0aa1f94c21016d60fa3f66fb194e56b8e9fceaa3860c603700efc3ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-openbabel
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
