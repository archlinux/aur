# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.40.1
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/vektra/mockery'
license=("BSD")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "golang-${pkgname%-bin}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('4cf4f71b6a2656eb2db0add0a508dad8d4095a16ffba0db4498c5b1d19bfc0c9')
sha256sums_x86_64=('6daa9bae11ffe158245eee1042b80573c3e8b0c8c7ec9dd125594280449b289d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}