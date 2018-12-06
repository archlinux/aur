# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=mcfly
pkgver=0.2.4
pkgrel=1
epoch=
pkgdesc="Fly through your shell history"
arch=('any')
url="https://github.com/cantino/mcfly"
license=('MIT')
makedepends=('rust' 'cargo')
install=mcfly.install
source=("https://github.com/cantino/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c0bcfa7f6395907f6cfb8bff379919de5bee17d4b7888e0308f15414e93f046b')

build() {
	cd "${pkgname}-${pkgver}"
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D -m755 "$srcdir/${pkgname}-${pkgver}/target/release/mcfly" "$pkgdir/usr/bin/mcfly"
	install -D -m644 "$srcdir/${pkgname}-${pkgver}/mcfly.bash" "$pkgdir/usr/share/doc/mcfly/mcfly.bash"
}
