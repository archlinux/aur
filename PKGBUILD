# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Charles Dong <charlesdong_2000@outlook.com>
pkgname=rickroll-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple rust program doing rickroll"
arch=("x86_64" "aarch64")
url="https://github.com/chardon55/rickroll-rs"
license=('MIT')
depends=('mpv')
makedepends=('cargo' 'rust' 'rustfmt')
checkdepends=()
optdepends=()
provides=()
conflicts=()
options=()
source=()

prepare() {
	mkdir -p $srcdir/${pkgver}-$pkgrel
}

build() {
	cargo install rickroll --locked --root $srcdir/${pkgver}-$pkgrel --target "$CARCH-unknown-linux-gnu"
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -m 755 $srcdir/${pkgver}-${pkgrel}/bin/rickroll $pkgdir/usr/bin/
}
