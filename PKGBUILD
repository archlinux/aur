# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.12.0
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
sha256sums_x86_64=('9c2a1e70913de0d85d6752829871a4111480ef69b2c23c9127e83f08a36ba268')
sha256sums_arm64=('35012a2b17a1bcab14588099bee23cbb070720a9a7ae4c4bb700e61fd4c158cc')
sha256sums_riscv64=('05d64d235417e3c7e304ecf6b9afb9cce23969af465fbb0d3a91de1e7d772190')
