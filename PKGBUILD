# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=mandown-md-viewer
_pkgname=mandown
pkgver=1.0.3
pkgrel=1
pkgdesc="man-page inspired Markdown viewer"
arch=('x86_64')
url="https://github.com/Titor8115/mandown"
license=('MIT')
makedepends=('ncurses' 'libxml2')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df92ca18315a7507ac93e2246d9ee2ad5363dcf4d266b57d5eb10b4123afa25c')

build() {
	cd "$_pkgname-$pkgver"
	PREFIX="/usr" make
}

package() {
	cd "$_pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
