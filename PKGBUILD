# Maintainer: James Baumgarten <jebaum at ucla dot edu>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sx-startx
_pkgname=sx
pkgver=3.0
pkgrel=1
pkgdesc='Simple alternative to startx(1) for starting an Xorg server'
arch=(any)
url='https://github.com/Earnestly/sx'
license=(MIT)
depends=(xorg-server xorg-xauth)
provides=(sx)
conflicts=(sx)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('69fd492e87f13a4d61565a0a9c42d1759dbd5f2eeb1ae9e460ab618a55878fae')

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
