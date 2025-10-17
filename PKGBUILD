# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kcl-bin
pkgver=0.17.0
pkgrel=1
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
sha256sums_aarch64=('3265d5436679a228cf5d06e917ba17602d9f22f077c9b30ba3a143a62b336cc4')
sha256sums_x86_64=('f3bb25a6ae2b4a08c304f50ec811d67b818e13ae5ebb4648e8404f2abdca5b20')
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
