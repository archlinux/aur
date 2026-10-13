# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.52.0
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
sha256sums=('4044ade9c21d8b084d3d16a03375cf3b7e166b946a327bb37a3fbbdb53287cfd')
sha256sums_x86_64=('46765d4e570ccb3d759e95bcec11feb42fceed5ab2453eac8d787f81d4a0cdab')
sha256sums_aarch64=('b1de881a0381f1f059ce9dbb0cfb97e0f94f22460965f39aaff77b2956024fa9')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
