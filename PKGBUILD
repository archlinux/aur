# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mkdbg-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Hardware debugging and crash forensics for Cortex-M, SoCs and Linux kernels"
arch=('x86_64' 'aarch64')
url="https://github.com/JialongWang1201/mkdbg"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JialongWang1201/mkdbg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mkdbg-native-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mkdbg-native-linux-arm64")
sha256sums=('c34b9129357e217b827f19742eb334fe3a3321b1af0d3acaf91ae631daeecb92')
sha256sums_x86_64=('bf757f80bc1677b79fff16892dc891bf41bf9bd442cc49ab174eb4f1c316595c')
sha256sums_aarch64=('cfe8f528a01464853aab75c73fca22c079eef84562b8b4683f09586fb702a5ce')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mkdbg-native"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
