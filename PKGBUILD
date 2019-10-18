pkgname=wishbone-tool
pkgver=0.4.6
pkgrel=1
pkgdesc='Utilities for working with a Wishbone bridge'
arch=(x86_64)
url='https://github.com/xobs/wishbone-utils'
license=(custom:BSD2clause)
depends=(gcc-libs)
makedepends=(rust)
source=(wishbone-tool-$pkgver.tar.gz::https://github.com/xobs/wishbone-utils/archive/v$pkgver.tar.gz)
sha256sums=('9fbb2723f134dd7f6d7f45053de7ce97e9ad971b69bea1578c2e347a4ea59fc8')

build(){
	cd "$srcdir/wishbone-utils-$pkgver/wishbone-tool"
	cargo build --release #--locked
}

package(){
	cd "$srcdir/wishbone-utils-$pkgver"
	install -Dm755 wishbone-tool/target/release/wishbone-tool -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



