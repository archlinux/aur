# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.47.0
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=('gcc-libs')
provides=('rtk')
conflicts=('rtk')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('4044ade9c21d8b084d3d16a03375cf3b7e166b946a327bb37a3fbbdb53287cfd')
sha256sums_x86_64=('7c0175d867f96c4f8f788479af82ca8f0990ea944226268834d224a525186fb7')
sha256sums_aarch64=('960ceb5f1f5f0b0939b32b5b1d41dec6d9a7113137b0703c68dca0d169a260fc')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
