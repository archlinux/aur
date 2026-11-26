# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gameboy-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Cross-platform Game Boy emulator"
arch=('x86_64')
url="https://github.com/libraries/gameboy"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/libraries/gameboy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gameboy_linux_amd64")
sha256sums=('b45a3d372b4f34135b1d3dcdd2e6b6843c3adb654350c620ee13bcf8cbf3b728')
sha256sums_x86_64=('80a832a520e1517e2a0be2138f74f5794c25db372cc0f288a1f89a8c767bdbee')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gameboy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
