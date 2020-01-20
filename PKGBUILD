pkgname=wishbone-tool
pkgver=0.6.0
pkgrel=1
pkgdesc='Utilities for working with a Wishbone bridge'
arch=(x86_64)
url='https://github.com/litex-hub/wishbone-utils'
license=(custom)
depends=(gcc-libs)
makedepends=(rust)
source=(wishbone-tool-$pkgver.tar.gz::https://github.com/litex-hub/wishbone-utils/archive/v$pkgver.tar.gz)
sha256sums=('bdd9b817dff6f228f3bf8f192044680c2009ddc6288841be1ecffe0d9afaf063')

build(){
	cd "$srcdir/wishbone-utils-$pkgver/wishbone-tool"
	cargo build --release --locked
}

package(){
	cd "$srcdir/wishbone-utils-$pkgver"
	install -Dm755 wishbone-tool/target/release/wishbone-tool -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



