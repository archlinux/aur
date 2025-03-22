# Maintainer: itsme <mymail@ishere.ru>

pkgname=linkerd-edge-bin
pkgver=25.2.3
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

sha256sums_x86_64=('e9f661a2c792dbfbc2251ec9c1837e98da829c8deefd3c08491eab07aebae82b')
sha256sums_armv7h=('b517d40805e3eddedf83f656afbc0b97ba8addaa9f9b1c4eb7ee22199274cd83')
sha256sums_aarch64=('b2d088799795d483c2b3015b2c1116242887bfeaf6cd602b3f6a6c21c1c2417f')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
