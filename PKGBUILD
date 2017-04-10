pkgname=diesel_cli
pkgver=0.12.0
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(rust)
makedepends=(cargo)
source=("https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('e20eb6a72e5dcc796ef4ea94a50ae9d1ae82400f2830282fc4f38b1c33fc0ee7')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
}
