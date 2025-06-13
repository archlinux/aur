pkgname=background.fm
pkgver=0.1.2
pkgrel=1
pkgdesc="Set your background as your now playing. Uses Last.fm API (Requires Last.fm scrobbling)."
arch=('x86_64')
url="https://github.com/bharat-nair/background.fm"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual hash for release builds

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -v -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
