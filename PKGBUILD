# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openneato-bin
pkgver=0.15
pkgrel=1
pkgdesc="Flasher for OpenNeato, a replacement for Neato's discontinued cloud and app"
arch=('x86_64' 'aarch64')
url="https://github.com/renjfk/OpenNeato"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/renjfk/OpenNeato/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/openneato-flash_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/openneato-flash_Linux_arm64")
sha256sums=('67f5dcaa9c3af2d4024b351b848ff6bd8ad7e44ae41e4704bf383905ba0adb4b')
sha256sums_x86_64=('830037b722705c75b49597c42060754ed7f0f9f46f5acbd41f5e1b163d78608d')
sha256sums_aarch64=('dd86b92c76b725a361d6d558c800c87869b740e63306312e83e0d720e201d49a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/openneato-flash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
