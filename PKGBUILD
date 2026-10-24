# Maintainer: Slush97 <slusheliott@gmail.com>
pkgname=vpkmerge-cli-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Combine multiple Valve Pak (.vpk) mods into one (Deadlock modding; CLI, prebuilt)"
arch=('x86_64')
url="https://github.com/Slush97/vpkmerge"
license=('MIT')
depends=('gcc-libs')
provides=('vpkmerge-cli')
conflicts=('vpkmerge-cli')
source=(
  "vpkmerge-cli-${pkgver}::${url}/releases/download/v${pkgver}/vpkmerge-linux-x86_64"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('06ec75c15ffd27330900e849f671dec885c5ed0f5ca6926472a0aa55a5d50a26'
            '00b2f40961e16423ce60d95c9087bde5bc5a2ed7d078312a56c54f0452863d19')

package() {
  install -Dm755 "${srcdir}/vpkmerge-cli-${pkgver}" "${pkgdir}/usr/bin/vpkmerge-cli"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
