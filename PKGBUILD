# Maintainer: itsme <mymail@ishere.ru>

pkgname=linkerd-edge-bin
pkgver=25.4.4
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

sha256sums_x86_64=('a786097526da780d72389e90e1f3a397e97be553c82376a2791e3aa4589ea6cf')
sha256sums_armv7h=('65dd1d8c22ba8f1b02d43441d2f59f19657476066859b0114ef9dcf786181141')
sha256sums_aarch64=('db28547640a53e88a653c915501ae28850fde398b81f71ddbcc87ac5733d1b56')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
