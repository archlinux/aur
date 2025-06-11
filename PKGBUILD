# Maintainer: Marco Ziliani <rylos78@duck.com>
# Author: Julian Alarcon <alarconj@gmail.com>
pkgname=prospect-mail-beta-bin
pkgver=0.6.0.beta1
linkver=0.6.0-beta1
pkgrel=1
pkgdesc="Prospect Mail is an Outlook Electron desktop application for the new design."
arch=('x86_64' 'aarch64' 'armv7l')
url="https://github.com/julian-alarcon/prospect-mail"
license=('MIT')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=()
optdepends=()
conflicts=('prospect-mail')
provides=('prospect-mail')
install="${pkgname}.install"
source_x86_64=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${linkver}/prospect-mail-${linkver}.pacman" 'LICENSE')
source_aarch64=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${linkver}/prospect-mail-${linkver}-aarch64.pacman" 'LICENSE')
source_armv7l=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${linkver}/prospect-mail-${linkver}-armv7l.pacman" 'LICENSE')
md5sums_x86_64=('fb75794e2ba1b8ca222d057b594e7d98'
                '8bc10d8d7c90786378362af8b5ce292f')
md5sums_aarch64=('2ff4b4eb6937f972c5cfbfc11c682183'
                 '8bc10d8d7c90786378362af8b5ce292f')
md5sums_armv7l=('7de3837d7e54d9e5181ebaf7093d5f41'
                 '8bc10d8d7c90786378362af8b5ce292f')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
