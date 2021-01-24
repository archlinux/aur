# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.9.2
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
    '67e51106600fe48315659e9e3261efd0169e6bb229ceb8d96af0eabd159624ef'
    )
# ARMv5 & ARMv6
source_arm=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm"
    )
sha256sums_arm=(
    '20996bd6e27fc0bd1f3535cade03b3dd166d5c2258e6b51045802f8b4d65038f'
    )
# ARMv7 hardfloat
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
# ARMv8 64bit
source_aarch64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64"
    )
sha256sums_aarch64=(
    '2ecf24937ddb35979aa93d5d2c5c45740ec099b6e75183fa6431674cfacd15cd'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

