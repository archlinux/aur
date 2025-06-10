# Maintainer: itsme <mymail@ishere.ru>

pkgname=linkerd-edge-bin
pkgver=25.5.5
pkgrel=1
pkgdesc="Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x. Recommended edge release."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://linkerd.io/"
license=('Apache')
depends=('glibc')
provides=('linkerd')
conflicts=('linkerd-bin')

source_x86_64=("linkerd-${pkgver}-x86_64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-amd64")
source_armv7h=("linkerd-${pkgver}-armv7h::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-arm")
source_aarch64=("linkerd-${pkgver}-aarch64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-arm64")

sha256sums_x86_64=('0496643692f69236eadc241979142ce9bb483cacfb16c2d5548e21b47df1dd9a')
sha256sums_armv7h=('29b151b13b0f8a5b7264c4342b0f79e8f02ade0a80215ec29d8a177c8144b21d')
sha256sums_aarch64=('c550438398fa6467739106dc2f580b30ce34607bf18907e99043ce56b4f3a1fe')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
