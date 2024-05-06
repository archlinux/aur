# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=0.1.8
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
b2sums=('2e81308da4f67c95f3a37192f69b1d12d0383df90d51cd506604b103e8a81d763f50ca70a0466b4cb1ab6d0369275c19b12d58a2fac4b5ba201e5c81cba48358')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
