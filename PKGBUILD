# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=karpor-bin
_pkgname=Karpor
pkgver=0.5.6
pkgrel=1
pkgdesc="Intelligence for Kubernetes. World's most promising Kubernetes Visualization Tool for Developer and Platform Engineering teams.(Written in Go,prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://karpor-demo.kusionstack.io/"
_ghurl="https://github.com/KusionStack/karpor"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'kubectl'
    'helm'
    'kind'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('75f00298e36a9c232a6a3ce9245a53bc7449ec8a0f0d7a14997636ed5567bc5f')
sha256sums_x86_64=('9677ce9c62c46a9d861141c8a51d8556b4005c2e8bf9d4772e742b7f48ace745')
package() {
    install -Dm755 "${srcdir}/"{cert-generator,"${pkgname%-bin}"} -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/docs/"* "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
