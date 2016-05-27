pkgname=diesel_cli
pkgver=0.6.1
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(rust)
makedepends=(cargo)
source=("https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('62ba5250908a937d3eac68ed6a275376064161e6438666afd9ea06d28ac699c9')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/$pkgname/target/release/diesel" "$pkgdir/usr/bin/diesel"
}
