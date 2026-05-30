# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=linkerd-edge-bin
pkgver=26.5.5
pkgrel=3
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

sha256sums_x86_64=('006ee7e7cc76c5882c535068a505735373f45c1083092b852a5edfd0d11ae06e')
sha256sums_aarch64=('08bde25da1c16c2f44c2dd95965598fa0659d1dccaa00b7bd94510a0d33ad8dd')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
