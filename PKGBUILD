# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=0.1.3
pkgrel=1
pkgdesc="A port of i3bar for the river Wayland compositor"
url="https://github.com/MaxVerevkin/i3bar-river"
arch=('x86_64')
license=('GPL3')
depends=(cairo pango)
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/MaxVerevkin/i3bar-river/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(165a211695560ad749f71a561ef30c6d391df99752169650638cce1328528da3)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
