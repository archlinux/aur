# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.linkerd-edge-bin

pkgname=linkerd-edge-bin
pkgver=26.9.3
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

sha256sums_x86_64=('79045fbc9352e3886127015a671d86ca78237ad72a32353df4602f6c6f235694')
sha256sums_aarch64=('2c9818e592448bffa111793b84c8d8164c857f1419438123470e0d3b6bed4d13')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
