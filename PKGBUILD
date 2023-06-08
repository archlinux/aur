# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kcl-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc="Your one stop shop to do anything with Kafka. Producing, consuming, transacting, administrating; 0.8.0 through 3.2+"
arch=('aarch64' 'x86_64')
license=('BSD3-Clause')
conflicts=("${pkgname%-bin}")
url="https://github.com/twmb/kcl"
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.gz")
source=("LICENSE::https://raw.githubusercontent.com/twmb/kcl/master/LICENSE")
sha256sums=('9ed9133de92870659a93ee70f11102dac696c23a65d68161fa292f1a23831be6')
sha256sums_aarch64=('3e776e7e4ca7c121f2697c266163856dc62fba4fb169842a615352cede093da9')
sha256sums_x86_64=('5aa884febadcdd2a67bae1843da0f8b14b17cce58e50f9f7574a9ef353a1fbba')
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}