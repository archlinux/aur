# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=mcfly
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Fly through your shell history"
arch=('any')
url="https://github.com/cantino/mcfly"
license=('MIT')
makedepends=('rust' 'cargo')
install=mcfly.install
source=("https://github.com/cantino/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('01b620d79c1ad3caf54519bca4d7375a7b981dde20a5ccdffddd53dc942744e7')

build() {
	cd "${pkgname}-${pkgver}"
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D -m755 "$srcdir/${pkgname}-${pkgver}/target/release/mcfly" "$pkgdir/usr/bin/mcfly"
	install -D -m644 "$srcdir/${pkgname}-${pkgver}/mcfly.bash" "$pkgdir/usr/share/doc/mcfly/mcfly.bash"
}
