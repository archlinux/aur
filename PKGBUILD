# Maintainer: Slush97 <slusheliott@gmail.com>
pkgname=vpkmerge-cli-bin
pkgver=0.28.0
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
sha256sums=('28979a284c6f2a9ada1a02f914d8df81dd1f69f906d46db1074431a6a0e5a43f'
            '00b2f40961e16423ce60d95c9087bde5bc5a2ed7d078312a56c54f0452863d19')

package() {
  install -Dm755 "${srcdir}/vpkmerge-cli-${pkgver}" "${pkgdir}/usr/bin/vpkmerge-cli"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
