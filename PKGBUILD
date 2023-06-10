# Maintainer (since 5.1.8): Vladimir Yakovlev <desktop-app@protonmail.ch>
# Maintainer (before 5.1.7): Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>
pkgname=electronmail-bin
pkgver=5.1.8
pkgrel=1
pkgdesc="Unofficial ProtonMail Desktop App"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('GPL3')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
optdepends=('org.freedesktop.secrets: password storage backend required for auto-login feature'
            'gnome-keyring: for storing passwords in GNOME Keyring')
conflicts=('electronmail')
provides=('electronmail')
install="${pkgname}.install"
source=("https://github.com/vladimiry/ElectronMail/releases/download/v${pkgver}/electron-mail-${pkgver}-linux-x64.pacman" 'LICENSE')
sha256sums=('7690c4b45d644feb582cbb7d33796b4077420f9c2cf0f2070d462e4c9d933f69'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')

package() {
  cd "$srcdir"
  
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
