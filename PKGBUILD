# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.linkerd-edge-bin

pkgname=linkerd-edge-bin
pkgver=26.8.3
pkgrel=1
pkgdesc="Ultralight, security-first service mesh for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://linkerd.io/"
license=('Apache')
depends=('glibc')
options=('!debug' '!strip')
provides=('linkerd')
conflicts=('linkerd-bin' 'linkerd-edge-recommended-bin')

source_x86_64=("linkerd-${pkgver}-x86_64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-amd64")
source_aarch64=("linkerd-${pkgver}-aarch64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-arm64")

sha256sums_x86_64=('d7c97472ac34e931fe143ca81c20617328845b439ed6601ce1f4bf6240cc6b1a')
sha256sums_aarch64=('59567496a3732a397ce96bd0b72f898b834c4d0bd867d4b4ea6aba51fa9dd473')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
