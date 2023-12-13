# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=plow-bin
pkgver=1.3.1
pkgrel=5
pkgdesc="A high-performance HTTP benchmarking tool that includes a real-time web UI and terminal display"
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=('a4348199343ce50894df6c16487c754826a53794470e70d854b261c379a053f5')
sha256sums_aarch64=('1312d8973e7a6f5878caf68f9565648cc753304ae7900bd5ce2fa1723bb415b1')
build() {
	bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}