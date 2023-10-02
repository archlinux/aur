# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=jeedom-status
pkgver=2.0.0
pkgrel=1
pkgdesc="Add Jeedom global status to your favorite desktop bar (i3blocks, polybar, etc...)"
arch=(x86_64)
url="https://github.com/deimosfr/jeedom-status"
license=('GPL')
makedepends=(git cargo)
source=("https://github.com/deimosfr/jeedom-status/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('f6eca707b50ed0700edb9b4991137e7a96b1ebf0966ee2ae46fce39fffa6e8f5')
