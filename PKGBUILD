# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="The package manager for RuyiSDK."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/ruyisdk/ruyi"
license=('Apache-2.0')
depends=('wget' 'git' 'tar' 'bzip2' 'xz' 'zstd')
provides=('ruyi=$pkgver')
options=('!strip') # !important, otherwise the binary will be broken
source_x86_64=("https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.amd64")
source_arm64=("https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.arm64")
source_riscv64=("https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.riscv64")

package() {
    install -d "${pkgdir}/usr/bin"
    if [ "$CARCH" == "x86_64" ]; then
        install -m755 "${srcdir}/ruyi.amd64" "${pkgdir}/usr/bin/ruyi"
    elif [ "$CARCH" == "arm64" ]; then
        install -m755 "${srcdir}/ruyi.arm64" "${pkgdir}/usr/bin/ruyi"
    elif [ "$CARCH" == "riscv64" ]; then
        install -m755 "${srcdir}/ruyi.riscv64" "${pkgdir}/usr/bin/ruyi"
    else
        echo "Unsupported architecture: $CARCH"
    fi
}
sha256sums_x86_64=('2122a644c6b80e86d49ea2c5b7f84096825e9d8f51f08adecf02ed74c1a7c8d6')
sha256sums_arm64=('35e208599fc503e96d4eb4ab036051f91abe7de3cd179dfeb4127769fe9d160d')
sha256sums_riscv64=('8e8a8e70a2a597b0121e9c94204ea3094744d5f7baaf779fd24ddaaa9a7fb6ac')
