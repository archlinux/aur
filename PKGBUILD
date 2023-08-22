# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Maintainer: Peter Smit <peter@smitmail.eu>

pkgname=linkerd
pkgver=2.13.4
pkgrel=1
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
    '0dc5181664f6a871d7601aca2ca33bdeefe55a63ed4ec252f1def462dbe2370d'
    )
# ARMv5 & ARMv6
source_arm=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm"
    )
sha256sums_arm=(
    'fa2bbd2ac28172d2b891699ec30324f1a8e71371b0cf10c809df2550d03c8e92'
    )
# ARMv7 hardfloat
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
# ARMv8 64bit
source_aarch64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64"
    )
sha256sums_aarch64=(
    '3df58ac9ea56899c9d1a914475bad051a34e49be2d9f8d77a8a5d1ebec6a3485'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}
