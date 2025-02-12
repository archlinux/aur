
# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.27.0
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
sha256sums_x86_64=('33d41cac0df3f3bd147ac25133d1a7724168f1026128cab3579c07a82078654c')
sha256sums_arm64=('b2caad48e05448103eefa429a78c1b235f4bd9c9db9e5f84465206497fd88c4c')
sha256sums_riscv64=('993c641f8e46fb901c88c3af269d18d3733672f0e012f050febf3d5c1c3d5bef')
