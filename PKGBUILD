# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kcl-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Your one stop shop to do anything with Kafka. Producing, consuming, transacting, administrating; 0.8.0 through 3.2+"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/twmb/kcl"
license=('LicenseRef-BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'kafka'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.gz")
source=("LICENSE::https://raw.githubusercontent.com/twmb/kcl/v${pkgver}/LICENSE")
sha256sums=('9ed9133de92870659a93ee70f11102dac696c23a65d68161fa292f1a23831be6')
sha256sums_aarch64=('1a2c0886c35257bc8dfe1a33c016be3b4b7afeefed58d4d68386fb3a3233c2b3')
sha256sums_x86_64=('97f84f90be06dc0b75c79eb3014f930596208578c536ac2d63e090f6dd6f24f0')
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}