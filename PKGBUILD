# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.linkerd-edge-bin

pkgname=linkerd-edge-bin
pkgver=26.11.3
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

sha256sums_x86_64=('474466af61cb16b1d411032e75fe758055c8f31354bbd54be658ea8ff9055cb0')
sha256sums_aarch64=('8ba38645ea8958fb763e7b040f8dc9c0074ed4eff61b1fc0cc2022c5452c7b3e')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
