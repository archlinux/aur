# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=findimage
pkgver=0.1.0
pkgrel=1
pkgdesc="Search for original sources of cropped images and thumbnails."
arch=('any')
url="http://szanni.org/findimage"
license=('BSD')
depends=('opencv>=4.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('6bd213c13b48b63d3efd44ed6a91c652011efe6c41aeb4e9129a190b46ccfe63')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
