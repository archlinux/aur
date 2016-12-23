# Maintainer: sqlwwx <wwx_2012@live.com>
# Contributors: Eduardo San Martin Morote http://posva.net/

pkgname=catimg
pkgver=2.2
pkgrel=1
pkgdesc="Print images in a terminal with 256 colors support"
arch=(any)
url="https://github.com/posva/catimg"
license=(MIT)
groups=('Applications/Multimedia')
depends=(glibc)
makedepends=(cmake)
source=("$url/archive/$pkgver.tar.gz#/$pkgname-$pkgver.tar.gz")
md5sums=("9981dd2158a8e2e9707e0620c335ef2c")

build() {
	cd "$pkgname-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" .
	make
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  make install
}
