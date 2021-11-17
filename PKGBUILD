# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.11.1
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
    '96c08570b6f6ad40ef1e6aa970959c9c5541e36c85477ee9843b85b8fdcc54ea'
    )
# ARMv5 & ARMv6
source_arm=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm"
    )
sha256sums_arm=(
    '33837ccca93f7d34617509aebb7f09e30c337578e39b72976d3f5bfc732663d5'
    )
# ARMv7 hardfloat
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
# ARMv8 64bit
source_aarch64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64"
    )
sha256sums_aarch64=(
    '50fb91d5eb05eb37a464270e836de24fb3bd13d7c1acb285f3a392fdf3313caa'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

