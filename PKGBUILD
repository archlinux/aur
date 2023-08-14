# Maintainer: J.R. Hill <justin@so.dang.cool>
pkgname="dt"
pkgver="1.2.3"
pkgrel=1
pkgdesc="It's duct tape for your unix pipes"
arch=('x86_64' 'aarch64')
url="https://github.com/so-dang-cool/dt"
license=('BSD-3-Clause')
makedepends=('zig-bin' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b0fc09eca856d7558ff08315d6ef344a58ab8fac4a27c9e0b7e77989c6a8325')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	zig build -Doptimize=ReleaseSafe
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "zig-out/bin/dt" "${pkgdir}/usr/bin/dt"
}

