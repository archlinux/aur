# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.8.0
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
sha256sums_aarch64=('628f7d277860f524a2a775c217adcc58828e7b59ab0933680315784f1b8b0e37'
                    '5a642b27d3e975f36040d215640cd90fb4a63cb6fca0ad5865a61bcd9c81051b')
sha256sums_armv7h=('628f7d277860f524a2a775c217adcc58828e7b59ab0933680315784f1b8b0e37'
                   '5a642b27d3e975f36040d215640cd90fb4a63cb6fca0ad5865a61bcd9c81051b')
sha256sums_x86_64=('f5a4385a2ae1b9dd7f8acae18e002a75c0ebba124ae9d7259aa8dadb50711f46'
                   'd5743166c657283d6e827c7c4c20cacfd9009fd94830f06718ca7b2c7099461f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}
