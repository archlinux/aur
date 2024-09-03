# Maintainer: Devin Neal <8bitZeta@protonmail.com>
# Author: Julian Alarcon <alarconj@gmail.com>
pkgname=prospect-mail-bin
pkgver=0.5.4
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
source_x86_64=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${pkgver}/prospect-mail-${pkgver}.pacman" 'LICENSE')
source_aarch64=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${pkgver}/prospect-mail-${pkgver}-aarch64.pacman" 'LICENSE')
source_armv7l=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${pkgver}/prospect-mail-${pkgver}-armv7l.pacman" 'LICENSE')
md5sums_x86_64=('c063d8b5ef9e56f02ad676c9aa1637a1'
                '8bc10d8d7c90786378362af8b5ce292f')
md5sums_aarch64=('3121da3add4ca64ad16ac88072aac048'
                 '8bc10d8d7c90786378362af8b5ce292f')
md5sums_armv7l=('40bef6587e0dfb6a8fb55351f084e477'
                 '8bc10d8d7c90786378362af8b5ce292f')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
