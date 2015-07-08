# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=findimage
pkgver=0.0.0
pkgrel=1
pkgdesc="Search for original sources of cropped images and thumbnails."
arch=('any')
url="http://szanni.org/findimage"
license=('BSD')
depends=('opencv>=2.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('635a51d5daec1cf2d233865c076f3ef13d6d5ba90557b020b39f60061982e3f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
