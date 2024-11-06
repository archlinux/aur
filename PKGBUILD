
# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="The package manager for RuyiSDK."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/ruyisdk/ruyi"
license=('Apache-2.0')
depends=('wget' 'git' 'tar' 'bzip2' 'xz' 'zstd')
provides=('ruyi=$pkgver')
options=('!strip') # !important, otherwise the binary will be broken
source_x86_64=("ruyi-$pkgver-bin-x86_64::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.amd64")
source_arm64=("ruyi-$pkgver-bin-arm64::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.arm64")
source_riscv64=("ruyi-$pkgver-bin-riscv64::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.riscv64")

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/ruyi-$pkgver-bin-$CARCH" "${pkgdir}/usr/bin/ruyi"
}
sha256sums_x86_64=('fa24aaa8e2bca60a95f55adc520afeafef9670fd891e1a2b414c07de2b32cfe8')
sha256sums_arm64=('326ea9936b3d7ad2bead3330effdfe54dda400f8ae4988649b4653691ee3ee50')
sha256sums_riscv64=('60d09e00d3c9ef3f8819b81d20ca325a7ba0668be0ae0677a216143eb0c8beed')
