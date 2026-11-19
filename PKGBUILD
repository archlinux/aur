# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=1.2.1
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
sha256sums_x86_64=('75f64525711be935657a6b228d929c24bd9d1ab7d640ea374a8b913e5b5bac05')
sha256sums_aarch64=('5fd75151feeae2b81b1844fca9889610cc77408361653ef3f95d4b9d3e278f4f')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
