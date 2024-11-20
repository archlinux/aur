
# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.22.0
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
sha256sums_x86_64=('bf4d73ac7c48f326d6809b4dc47a23375f0baf27cd4215a4cc5c78068f0a1b31')
sha256sums_arm64=('0afbd7728b3ea9c8907f05540b1c978d165fc7d8bff1247c039e1868913ad9d6')
sha256sums_riscv64=('be7dd9a9d806c48cef909e0ebe9a82239c3a2921649ec41cab54f8738b8d2ea7')
