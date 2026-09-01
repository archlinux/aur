# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.46.0
pkgrel=2
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
sha256sums_x86_64=('79aa5b89c69566bbfeceb66c8a27cfbe52237fc7ee3e683115f43745a3262d21')
sha256sums_aarch64=('e8c2e1787f46017ea7c5a711b2bc6a7f7cf61c7ad69385b4c1e4daff1135dcd1')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
