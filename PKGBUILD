# Maintainer: J.R. Hill <justin@so.dang.cool>
pkgname="dt"
pkgver="1.3.1"
pkgrel=2
pkgdesc="It's duct tape for your unix pipes"
arch=('x86_64' 'aarch64')
url="https://github.com/so-dang-cool/dt"
license=('BSD-3-Clause')
makedepends=('zig' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2849ea530b9de91525c604b609197bf04989fa53c4678b9c6332a5c5796505ee')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	zig build -Doptimize=ReleaseSafe
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "zig-out/bin/dt" "${pkgdir}/usr/bin/dt"
}

