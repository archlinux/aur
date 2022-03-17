# Maintainer: Max1Truc <max1truc @ disroot dot org>
_pkgname="magic-wormhole.rs"
pkgname="magic-wormhole-rs"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Rust implementation of Magic Wormhole, with new features and enhancements"
arch=('x86_64')
url="https://github.com/magic-wormhole/$_pkgname"
license=('EUPL-1.2+')
# depends=('fuse2')
makedepends=('cargo')
# optdepends=('bash-completion: Bash completion')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('77fe34c3ec85f80cd5578b423249ee09ee579cd590c29ce5068473bf8a685f4b4d4512f3801b4b5716c0b46bd6ebf59dbef9b1918ec3ebd36846e925ae67fdfa')

_sourcedirectory="$_pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	cargo build --release --locked --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/wormhole-rs" "$pkgdir/usr/bin/wormhole-rs"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EUPL-1.2"
}
