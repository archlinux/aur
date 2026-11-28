# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gameboy_emulator-bin
pkgver=0.2.8.8
pkgrel=1
pkgdesc="Game Boy emulator"
arch=('x86_64')
url="https://github.com/benkonz/gameboy_emulator"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gameboy_emulator-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4de1ff601d317ff754240c9f1bbfa9137321755f7c5e913233968f42551377f0')

package() {
  install -Dm755 "gameboy_emulator-${pkgver}-x86_64-unknown-linux-gnu/gameboy_emulator" "${pkgdir}/usr/bin/gameboy_emulator"
  install -Dm644 "gameboy_emulator-${pkgver}-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "gameboy_emulator-${pkgver}-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
