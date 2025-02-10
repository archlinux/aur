# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=karpor-bin
_pkgname=Karpor
pkgver=0.6.2
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
sha256sums_aarch64=('d71dce279fb979d235955b7306c3a2e4c32426001af78a193a97ebc9435ad0f8')
sha256sums_x86_64=('748d7204bd061c85a2df44dab97f38f578906a3920fe44b6bc94398e91a820b2')
package() {
    install -Dm755 "${srcdir}/"{cert-generator,"${pkgname%-bin}"} -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/docs/"* "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}