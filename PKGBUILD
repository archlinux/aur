
# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.16.0
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
sha256sums_x86_64=('2460e882b332e927ef914220abaa6b568058c706a2ff14edf0049e4b7fb7574d')
sha256sums_arm64=('651916e5b3d55a39a5cefb137000f8fa77b4e9a20775d231c5712723bb26a11b')
sha256sums_riscv64=('ae289475dac63432eefabab7cb33058d56c670f97a53d2349cd208f75df98eb6')
