# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang
pkgver=0.10.1
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language."
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('009ed827b7697a47a7eaec0be6cec79424074900f51d518782836215bda0fd28')

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
