# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=mandown-md-viewer
_pkgname=mandown
pkgver=1.0.4
pkgrel=2
pkgdesc="man-page inspired Markdown viewer"
arch=('x86_64')
url="https://github.com/Titor8115/mandown"
license=('MIT')
depends=('libxml2' 'libconfig')
makedepends=('ncurses')
install="${pkgname}.install"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc719e6a28a4585fe89458eb8c810140ed5175512b089b4815b3dda6a954ce3e')

build() {
  cd "$_pkgname-$pkgver"
  PREFIX="/usr" make
}

package() {
  cd "$_pkgname-$pkgver"
  PREFIX="$pkgdir/usr" make install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
