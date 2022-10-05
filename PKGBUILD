# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=findimage
pkgver=0.1.1
pkgrel=1
pkgdesc="Search for original sources of cropped images and thumbnails."
arch=('any')
url="http://szanni.org/findimage"
license=('BSD')
depends=('opencv>=4.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('8daa556a5f161cf41e2ee0146f4de8c65ffce362674f759cf9ee1b17b69f479d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
