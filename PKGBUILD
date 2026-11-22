# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=void-tui-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A focus app with built-in task management, streak tracking, and customizable break schedules"
arch=('x86_64')
url="https://github.com/p6laris/Void"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/p6laris/Void/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/void-linux-amd64.tar.gz")
sha256sums=('e034c381ec793605aa8413729d9a067841110465f4e022b910c40702c9abd97f')
sha256sums_x86_64=('7df4c54f04529740fcb7bcae64b2bfbeccda5edf2a10c46eb6ca21d3d4fdbcd2')

package() {
  install -Dm755 "void" "${pkgdir}/usr/bin/void"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
