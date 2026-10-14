# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=1.0.1
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
sha256sums_x86_64=('5b919c3bccb799b67a61866d0e617410a4fcdf173e2614440e59de2fa2003436')
sha256sums_aarch64=('cd627c4091ad90b5e5aca83ca5af66ee4b8aa8537a736533fa90544f461f1c2b')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
