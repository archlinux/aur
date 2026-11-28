# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opcilloscope-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Browse and monitor OPC UA servers from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/SquareWaveSystems/opcilloscope"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/opcilloscope-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/opcilloscope-linux-arm64.tar.gz")
sha256sums_x86_64=('8d0e9a2c6247387a766b0c9c9ea8569db3c3fc7a5a4297e691f2999701fbbf1e')
sha256sums_aarch64=('2908dc864b2abd8825fce233fe6362c215016f2045821a4d4be6fe7cfb94c796')

package() {
  install -Dm755 "./opcilloscope" "${pkgdir}/usr/bin/opcilloscope"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
