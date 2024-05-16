# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.10.0
pkgrel=2
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
sha256sums_x86_64=('890ef23dfdf6cd4b753828fe40790f8dbddf68f20dda2fc75e51da0589c62165')
sha256sums_arm64=('08307b88882d5f0aa13d07197c19a93b64398df4805f1e3b439def283e0d5859')
sha256sums_riscv64=('b56ee9b32ce85cb2b63ca38331be0f473591a366fb5670d8b71cd9a5ea08cd28')
