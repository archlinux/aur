# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ymir-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Sega Saturn emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/ymir-emu/Ymir"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++' 'vulkan-icd-loader')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/ymir-linux-x86_64-AVX2-v${pkgver}.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/ymir-linux-AArch64-NEON-v${pkgver}.tar.xz")
sha256sums_x86_64=('53f0b92fe10e1471c5413ae881ff9804049a2c6001594eab31dbf6d0aaa25f1c')
sha256sums_aarch64=('30b7eab364b7d1569b84530eaadc26bfcdd790c1fa55366e8235935d0678f248')

package() {
  install -Dm755 "ymir-sdl3" "${pkgdir}/usr/bin/ymir-sdl3"
  install -Dm644 "licenses/MaterialSymbols/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
