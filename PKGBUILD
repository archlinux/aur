# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Kubernetes WithOut Kubelet - Simulates thousands of Nodes and Clusters."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://kwok.sigs.k8s.io/"
_githuburl="https://github.com/kubernetes-sigs/kwok"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
    "${pkgname%-bin}ctl-${pkgver}-aarch64::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
    "${pkgname%-bin}ctl-${pkgver}-armv7h::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
    "${pkgname%-bin}ctl-${pkgver}-x86_64::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}ctl-linux-amd64")
sha256sums_aarch64=('ff7877f4b54c087fcd1dc99c6fcd2790b6d491554d21f9dee2e43337468dca25'
                    'f96b55a17a6049a02ff4074a2df9d0d1b9bafbe5534cf549256185a24052ea3c')
sha256sums_armv7h=('ff7877f4b54c087fcd1dc99c6fcd2790b6d491554d21f9dee2e43337468dca25'
                   'f96b55a17a6049a02ff4074a2df9d0d1b9bafbe5534cf549256185a24052ea3c')
sha256sums_x86_64=('1aa2ec5534b2eaa85a966751a997cb422157b8501af8a487559b0a9a239904f2'
                   '429b0d19871dcbad1ed3a7c2190c75625d5e9048a4dadc53451d8822f9dd5287')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}