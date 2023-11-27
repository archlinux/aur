# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=0.1.6
pkgrel=1
pkgdesc="A port of i3bar for river"
url="https://github.com/MaxVerevkin/i3bar-river"
arch=('x86_64')
license=('GPL3')
depends=(cairo pango)
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://github.com/MaxVerevkin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47051e2da1fcae6f3a28a53ea05c243ac44f963a5e67c6b799ed5efc7819df9f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
