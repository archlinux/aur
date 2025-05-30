# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang
pkgver=0.7.1
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language."
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81b826a97d4ba3dea5d1d8b999bf440e0b9a2ecc131370c04e3753ea070f343b')

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
