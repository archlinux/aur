# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.5.0
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
sha256sums_aarch64=('3be27942b6ab49a9408feed7d4c08f9c35bbadbb822deb0b19c2afc536f44abd'
                    '0b00ce5c3e339670be154d296e561a8f0d0dc8d21e428dfcb21ef7d134328130')
sha256sums_armv7h=('3be27942b6ab49a9408feed7d4c08f9c35bbadbb822deb0b19c2afc536f44abd'
                   '0b00ce5c3e339670be154d296e561a8f0d0dc8d21e428dfcb21ef7d134328130')
sha256sums_x86_64=('5575549e4dd4702259e74f05b53470ab8dcf291d3f5aaefc2c660db4b2a88f50'
                   '034566e10138ef72c8ddd789402d76729686d09be84a353ad1633e4c1aa60be0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}