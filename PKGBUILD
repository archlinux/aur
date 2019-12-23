# Maintainer: Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>
pkgname=electronmail-bin
pkgver=4.0.0
pkgrel=2
pkgdesc="Unofficial desktop app for several E2E encrypted email providers"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('MIT')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3' 'gconf' 'libsecret')
conflicts=('electronmail')
provides=('electronmail')
install="${pkgname}.install"
source=("https://github.com/vladimiry/ElectronMail/releases/download/v${pkgver}/electron-mail-${pkgver}-linux-x64.pacman" 'LICENSE')
md5sums=('0443f765858debfc8dfa35c3eee13391'
         'fc680045f40b19ce3c3e771aeb08bbd3')

package() {
  cd "$srcdir"
  
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
