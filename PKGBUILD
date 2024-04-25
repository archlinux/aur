# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Kubernetes WithOut Kubelet - Simulates thousands of Nodes and Clusters."
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
sha256sums_aarch64=('519a6e7c22aad6a4a1e9f40212d861d42af5410249584fb18613b35a4ba9433c'
                    'bacbb7b7d8fa6cc699b92cd6257d827ef7cdef56b1930a6f1059baaac3a72a37')
sha256sums_armv7h=('519a6e7c22aad6a4a1e9f40212d861d42af5410249584fb18613b35a4ba9433c'
                   'bacbb7b7d8fa6cc699b92cd6257d827ef7cdef56b1930a6f1059baaac3a72a37')
sha256sums_x86_64=('6d314e30951876eb491b488600dfcf4d9ca153e1de0df3526703545d20927c33'
                   'ebf9dffe942ddbf1811a0031b49da232badbeef8fec46dd1693d9629f128fd6c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}