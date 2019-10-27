pkgname=wishbone-tool
pkgver=0.4.7
pkgrel=1
pkgdesc='Utilities for working with a Wishbone bridge'
arch=(x86_64)
url='https://github.com/xobs/wishbone-utils'
license=(custom:BSD2clause)
depends=(gcc-libs)
makedepends=(rust)
source=(wishbone-tool-$pkgver.tar.gz::https://github.com/xobs/wishbone-utils/archive/v$pkgver.tar.gz)
sha256sums=('c9a5d5566d43f88c27fd53096ef8b7081427b9254b35cfa16082784f909a5a4f')

build(){
	cd "$srcdir/wishbone-utils-$pkgver/wishbone-tool"
	cargo build --release --locked
}

package(){
	cd "$srcdir/wishbone-utils-$pkgver"
	install -Dm755 wishbone-tool/target/release/wishbone-tool -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



