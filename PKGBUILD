# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.5.1
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
sha256sums_aarch64=('f829cb91302f00aababf7af0442f26a25d88084a14f29285990a98244256b307'
                    '942db43d07d3e052d3cc18a10cbb4301652ae890d9d111fb1380395354918224')
sha256sums_armv7h=('f829cb91302f00aababf7af0442f26a25d88084a14f29285990a98244256b307'
                   '942db43d07d3e052d3cc18a10cbb4301652ae890d9d111fb1380395354918224')
sha256sums_x86_64=('dcbee0c4a066545ffdc46d06a9e3bec941413354953a05774becd6c546fb26c4'
                   '1883901c77a4835002e1bb97699756c28afcea56507c3cf56c0ff36fc3f5f673')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}