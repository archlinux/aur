pkgname=wishbone-tool
pkgver=0.4.3
pkgrel=1
pkgdesc='Utilities for working with a Wishbone bridge'
arch=(x86_64)
url='https://github.com/xobs/wishbone-utils'
license=(custom:BSD2clause)
depends=(gcc-libs)
makedepends=(rust)
source=(wishbone-tool-$pkgver.tar.gz::https://github.com/xobs/wishbone-utils/archive/v$pkgver.tar.gz)
sha256sums=('09119f077d97ae15ebbb7a8d2b83def5c73b0b4ce92f77e7be1a62327f23f60e')

build(){
	cd "$srcdir/wishbone-utils-$pkgver/wishbone-tool"
	cargo build --release --locked
}

package(){
	cd "$srcdir/wishbone-utils-$pkgver"
	install -Dm755 wishbone-tool/target/release/wishbone-tool -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



