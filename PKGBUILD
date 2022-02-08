# Maintainer: Devin Neal <8bitZeta@protonmail.com>
# Author: Julian Alarcon <alarconj@gmail.com>
pkgname=prospect-mail-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Prospect Mail is an Outlook Electron desktop application for the new design."
arch=('x86_64')
url="https://github.com/julian-alarcon/prospect-mail"
license=('MIT')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=()
optdepends=()
conflicts=('prospect-mail')
provides=('prospect-mail')
install="${pkgname}.install"
source=("https://github.com/julian-alarcon/prospect-mail/releases/download/v${pkgver}/prospect-mail-${pkgver}.pacman" 'LICENSE')
md5sums=('56e3b27b95265ac6144f660a59bc4eca'
         '880ab7bab448377f481e0f4b614f2828')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
