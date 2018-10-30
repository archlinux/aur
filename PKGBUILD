# Maintainer: Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>
pkgname=email-securely-app-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Unofficial desktop app for several E2E encrypted email providers"
arch=('x86_64')
url="https://github.com/vladimiry/email-securely-app"
license=('MIT')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'gconf' 'gnome-keyring')
conflicts=('email-app-securely')
provides=('email-app-securely')
install="${pkgname}.install"
source=("https://github.com/vladimiry/email-securely-app/releases/download/v${pkgver}/email-securely-app-${pkgver}-linux.pacman" 'LICENSE')
md5sums=('173388e1b6481dcbe25f10634213f87e' 'fc680045f40b19ce3c3e771aeb08bbd3')

package() {
  cd "$srcdir"
  
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

