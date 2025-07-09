
# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="The package manager for RuyiSDK."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/ruyisdk/ruyi"
license=('Apache-2.0')
depends=('wget' 'git' 'tar' 'bzip2' 'xz' 'zstd')
provides=('ruyi=$pkgver')
options=('!strip') # !important, otherwise the binary will be broken
source_x86_64=("ruyi-$pkgver-bin-x86_64::https://fast-mirror.isrc.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.amd64")
source_arm64=("ruyi-$pkgver-bin-arm64::https://fast-mirror.isrc.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.arm64")
source_riscv64=("ruyi-$pkgver-bin-riscv64::https://fast-mirror.isrc.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.riscv64")

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/ruyi-$pkgver-bin-$CARCH" "${pkgdir}/usr/bin/ruyi"
}
sha256sums_x86_64=('69880269a32fbc1455927049f36903d4254ab427adb0a749cae675e87a6861e9')
sha256sums_arm64=('dab109ad8d3a47f7adc7094ae5390ce6ec03a95fdf889b7bedcfcff400e224ff')
sha256sums_riscv64=('c7f257269c0eda9d141bdea96c14d46899586133afd39571aa947bba455201e7')
