# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.43.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/vektra/mockery'
license=("BSD-3-Clause")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "golang-${pkgname%-bin}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('404f5f070b5f3effd93e8159b498495531dd3cc860630a3ac0b1517615edd5e7')
sha256sums_x86_64=('ecb3a4ac0023bcb0025c15a7c49d2aa60af22745a32e2862234ca174d576be2e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}