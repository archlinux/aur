# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.linkerd-edge-bin

pkgname=linkerd-edge-bin
pkgver=26.9.1
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

sha256sums_x86_64=('094e1de06215fbe76fc011cf62c96214f8dae0cd5a58135fb40307be88b6b176')
sha256sums_aarch64=('f92eddc52dc1f3089b65fd16014cdb1bc6b07c3fd177091c365cf3d8c0ea1a8b')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
