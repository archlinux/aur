# Maintainer: Rihards Skuja <rhssk at posteo dot eu>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: ArmandasJ <armandas@gmail.com>

pkgname=aspell-lv
pkgver=0.9.3
pkgrel=1
pkgdesc='Latvian aspell dictionary'
arch=('any')
depends=('aspell')
url='http://dict.dv.lv/download.php?prj=lv'
source=("http://dict.dv.lv/download/aspell6-lv-$pkgver.tar.bz2")
license=('GPL2')
sha256sums=('f14cdaf36a676e966cfe4ba9071c2b14c06d66153763eae13dc0e53838f74097')

build() {
  cd "$srcdir/aspell6-lv-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-lv-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "$pkgdir/usr/share/licenses/custom/$pkgname/COPYING"
}
