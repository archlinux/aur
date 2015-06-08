# Maintainer:
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=liboglappth
pkgver=1.0.0
pkgrel=2
pkgdesc='Library containing computational chemistry facility of ghemical'
license=('GPL')
arch=('x86_64' 'i686')
url='http://bioinformatics.org/ghemical/libghemical/'
depends=('gcc-libs')
makedepends=('mesa')
options=('!libtool')
source=("http://bioinformatics.org/ghemical/download/release20111012/$pkgname-$pkgver.tar.gz")
sha256sums=('b461a31065d6912d190f78ad0041218009f44a5acdb5757545bd4a8bd6b509aa')

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
