# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kwok-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Kubernetes WithOut Kubelet - Simulates thousands of Nodes and Clusters."
arch=('x86_64')
url="https://kwok.sigs.k8s.io/"
_githuburl="https://github.com/kubernetes-sigs/kwok"
license=('Apache')
options=(!strip)
provides=()
conflits=("${pkgname%-bin}")
depends=()
source=("${pkgname%-bin}-${pkgver}::https://github.com/kubernetes-sigs/kwok/releases/download/v0.2.0/kwok-linux-amd64"
    "${pkgname%-bin}ctl-${pkgver}::https://github.com/kubernetes-sigs/kwok/releases/download/v0.2.0/kwokctl-linux-amd64")
sha256sums=('7a588a90dced32dca9b79e026f677f6588ce55163ca19cc6b5994d645aec55ca'
            'b48b06df6ec269040d2f3fd7123c63d63ba31bbd847de8b104d2119a001a5df7')
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}ctl-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}ctl"
}