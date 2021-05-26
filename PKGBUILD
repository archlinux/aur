# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.10.2
pkgrel=0
pkgdesc="A service sidecar for Kubernetes and beyond. Main repo for Linkerd 2.x.  - https://linkerd.io"
arch=('x86_64')
url="https://linkerd.io/2/getting-started/"
license=('Apache')
depends=('glibc')
# X86 64bit
source_x86_64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-amd64"
    )
sha256sums_x86_64=(
    '7021232b50368b247e8d5226d381a654327f610c4f61d6719dc6fd6e46284035'
    )
# ARMv5 & ARMv6
source_arm=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm"
    )
sha256sums_arm=(
    '16d1010603a5c39195ac83a45c305222fa7cb7c784e0e1d9b08e198e0755382f'
    )
# ARMv7 hardfloat
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
# ARMv8 64bit
source_aarch64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64"
    )
sha256sums_aarch64=(
    'bd14989d7749a6055ac74f7e45a8c646efd7cba0f370bcd7fdc29becd093df9c'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}
