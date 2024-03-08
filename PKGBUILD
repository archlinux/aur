# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kcl-bin
pkgver=0.15.0
pkgrel=2
pkgdesc="Your one stop shop to do anything with Kafka. Producing, consuming, transacting, administrating; 0.8.0 through 3.2+"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/twmb/kcl"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'kafka'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.gz")
source=("LICENSE::https://raw.githubusercontent.com/twmb/kcl/v${pkgver}/LICENSE")
sha256sums=('9ed9133de92870659a93ee70f11102dac696c23a65d68161fa292f1a23831be6')
sha256sums_aarch64=('53954ee51d663b113ec7624499c12e6438ca5de61ff4a59c0ba76253472bb1a2')
sha256sums_x86_64=('6832f7e07dbfc3d777203fa2837237706d67317bbb9090a76b2c26bafa04c980')
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}