# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Maintainer: Peter Smit <peter@smitmail.eu>

pkgname=linkerd
pkgver=2.12.0
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
    '9c608044aa11bdecd793151cbea45f12ed87d9a8913ab7be1795e7b3c9934724'
    )
# ARMv5 & ARMv6
source_arm=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm"
    )
sha256sums_arm=(
    '8b87e28d98f6ed948967b0fb27ab14efa81e285e391e73d7fc56b954f9b4715d'
    )
# ARMv7 hardfloat
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
# ARMv8 64bit
source_aarch64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64"
    )
sha256sums_aarch64=(
    'c1d5f5c5663bcec524a393e129861449aad104d47f661c1fd1e1050adb7c5d21'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

