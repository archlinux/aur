# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang
pkgver=0.10.0
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language."
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b569ec6e72e98abd5c13ae5275170cd2abd5a2e059d6716b39f66f9ab78de3a4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cobaltc" "$pkgdir/usr/bin/cobaltc"
	install -Dm755 "target/release/cobalt" "$pkgdir/usr/bin/cobalt"
	install -Dm755 "target/release/cbproj" "$pkgdir/usr/bin/cbproj"
}
