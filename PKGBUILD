# Maintainer: Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>
pkgname=email-securely-app-bin
pkgver=2.0.0
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
source=("https://github.com/vladimiry/email-securely-app/releases/download/v${pkgver}/email-securely-app-${pkgver}-linux-x64.pacman" 'LICENSE')
md5sums=('190376f0f7b795ab7c0ab7cd0df45487'
         'fc680045f40b19ce3c3e771aeb08bbd3')

package() {
  cd "$srcdir"
  
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

