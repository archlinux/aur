# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="The package manager for RuyiSDK."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/ruyisdk/ruyi"
license=('Apache-2.0')
depends=('wget' 'git' 'tar' 'bzip2' 'xz' 'zstd')
provides=('ruyi')
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
sha256sums_x86_64=('5358cd9a0b059a450ce49a7853b48d976aecc9fcfbf72ad7134e49afb2291487')
sha256sums_arm64=('6d98cbddabee0ab3833f06fd4bc24faf749a5048f2f662fea068a43e40c3b373')
sha256sums_riscv64=('5a6a417073307b6d151eaa5e0a1a2b081574c82df48b2225630d63de146beb9c')
