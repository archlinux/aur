# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
depends_aarch64=('glibc' 'libgcc')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
provides=('rtk')
conflicts=('rtk')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('33f694a31d9f9df3e292a9413a3cdb0113fa72698e2c719f657ff6b53165dcc4')
sha256sums_x86_64=('b0b69fbed72f55d8eae18587c0b6bc140a8a8b39d5b7c6e6df33795249940926')
sha256sums_aarch64=('9438c2c99d428fa6fbe7f4d1c01a87babd5feec17ee6d7bb3372a613a21db7d3')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
