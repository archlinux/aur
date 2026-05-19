# Maintainer: Shahriyar <shahriyardx@github.com>
# Contributor: Shahriyar

pkgname=brightctrl
pkgver=0.0.8
pkgrel=1
pkgdesc="Terminal UI for external monitor brightness control via DDC/CI"
arch=("x86_64" "aarch64")
url="https://github.com/shahriyardx/brightctrl"
license=("MIT")
depends=("ddcutil")
makedepends=("bun")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("SKIP")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  bun install --frozen-lockfile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  bun run compile
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 brightctrl "$pkgdir/usr/bin/brightctrl"
  install -Dm755 brightctrl "$pkgdir/usr/bin/bctrl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
