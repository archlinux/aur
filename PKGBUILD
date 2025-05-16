# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Kubernetes WithOut Kubelet - Simulates thousands of Nodes and Clusters.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://kwok.sigs.k8s.io/"
_ghurl="https://github.com/kubernetes-sigs/kwok"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=(
    "${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
    "${pkgname%-bin}ctl-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-arm64"
)
source_armv7h=(
    "${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
    "${pkgname%-bin}ctl-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-arm64"
)
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
    "${pkgname%-bin}ctl-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-amd64"
)
sha256sums_aarch64=('d66e9a2532ecfecff83de0f68ee1973a941b9c145ca246340cf9e8de8aeca033'
                    '57e78abd75ca52d065c3d1921b7039b6134c89351ed618e8092fa66f4792ae23')
sha256sums_armv7h=('d66e9a2532ecfecff83de0f68ee1973a941b9c145ca246340cf9e8de8aeca033'
                   '57e78abd75ca52d065c3d1921b7039b6134c89351ed618e8092fa66f4792ae23')
sha256sums_x86_64=('56ca852c4aa5851b44e99019214942ec55c6b6c25cbf85bea91019c1931b3415'
                   'f21329c7522f4c3ab3f27caeaa5598820cb4560a0d4584fb69c4c79c66b8e0b5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}
