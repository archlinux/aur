# Maintainer: itsme <mymail@ishere.ru>

pkgname=linkerd-edge-bin
pkgver=25.4.1
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

sha256sums_x86_64=('2055018e8be536564430c5f665c30243aba715edbee08585012b82a046f67ce8')
sha256sums_armv7h=('9b5289f953f52afdbb6fde93d15f60ced67396a93c15acae0ab666315b622e0f')
sha256sums_aarch64=('ac78a241c151cf039d2dc4b8ac3f2ebbb5a4aac84975ffdf085e519bb24f902d')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
