# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=slideextract
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract slides from videos."
arch=('any')
url="http://szanni.org/slideextract"
license=('BSD')
depends=('opencv>=4.0')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('86aa11ce54bd79329b0774a7deb00e3dd9649a208fdc53514366f0a29390b96d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
