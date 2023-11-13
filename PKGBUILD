# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kcl-bin
pkgver=0.13.0
pkgrel=2
pkgdesc="Your one stop shop to do anything with Kafka. Producing, consuming, transacting, administrating; 0.8.0 through 3.2+"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/twmb/kcl"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'kafka'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.gz")
source=("LICENSE::https://raw.githubusercontent.com/twmb/kcl/v${pkgver}/LICENSE")
sha256sums=('9ed9133de92870659a93ee70f11102dac696c23a65d68161fa292f1a23831be6')
sha256sums_aarch64=('0e01c797a230aabb33d9826f0ede25e9ba0f2bf9c0b05165c32a02e4ec2d6756')
sha256sums_x86_64=('bede0a1ae53c738330cd18d2b23cc3f1ef0235dc84874a97c14c78e727edbe98')
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}