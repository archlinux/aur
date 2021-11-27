# Maintainer: Tom Pillot <tom dot pillot at pm dot me>
pkgname=gopass-ui-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Awesome UI for the gopass CLI – a password manager for your daily business"
arch=('x86_64')
url="https://github.com/codecentric/gopass-ui"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss'
         'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3' 'gopass')
provides=('gopass-ui')
install="${pkgname}.install"
source=("https://github.com/codecentric/gopass-ui/releases/download/v${pkgver}/gopass-ui-${pkgver}.pacman" 'LICENSE')

sha256sums=('f347618be91a79ad39804a41d9165dec6336d0a7a7c8c316200efca8376e565f'
            '21852b19d5c49c5d36f2c23cc60a299beeb94a64ec197dab5a57065fd73ecac3')

package() {
  cd "$srcdir"
  
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
