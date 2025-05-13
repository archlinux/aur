# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=mandown-md-viewer
_pkgname=mandown
pkgver=1.0.5.2
pkgrel=1
pkgdesc="man-page inspired Markdown viewer"
arch=('x86_64')
url="https://github.com/Titor8115/mandown"
license=('MIT')
depends=('libxml2' 'libconfig')
makedepends=('ncurses')
install="${pkgname}.install"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9903203fb95364a8b2774fe4eb4260daa725873d8f9a6e079d4c2ace81bede92')

build() {
  cd "$_pkgname-$pkgver"
  PREFIX="/usr" make
}

package() {
  cd "$_pkgname-$pkgver"
  PREFIX="$pkgdir/usr" make install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
