# Maintainer: itsme <mymail@ishere.ru>

pkgname=linkerd-edge-bin
pkgver=25.4.2
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

sha256sums_x86_64=('1b9bcc9ae3c9f184ee04801662df1113d089e3a0858058e0e991dafc5293283f')
sha256sums_armv7h=('7c53ea950ba8312dd88058bf7b41fb3d075578235511de64b5af3eb7b96ed454')
sha256sums_aarch64=('9f7d0c889c8cc137e38c4b66c0b30742008f489f5e81d4c43c6f7f80a54a2241')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
