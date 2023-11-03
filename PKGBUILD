# Maintainer: Devin Neal <8bitZeta@protonmail.com>
# Author: Julian Alarcon <alarconj@gmail.com>
pkgname=prospect-mail-bin
pkgver=0.5.2
pkgrel=0
pkgdesc="Prospect Mail is an Outlook Electron desktop application for the new design."
arch=('x86_64' 'aarch64')
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
md5sums_x86_64=('e4114043432eea6b899da817d6d425b0'
                '8bc10d8d7c90786378362af8b5ce292f')
md5sums_aarch64=('82ca565658c794abffc4df9d1796babb'
                 '8bc10d8d7c90786378362af8b5ce292f')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
