# Maintainer: Shreyans Jain <shreyansthebest2007@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-assistant-unofficial-desktop-client-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A cross-platform unofficial Google Assistant Client for Desktop (powered by Google Assistant SDK)"
arch=('x86_64')
url="https://github.com/Melvin-Abraham/Google-Assistant-Unofficial-Desktop-Client"
license=('Apache')
depends=('gtk3' 'nss' 'alsa-lib')
provides=("Melvin-Abraham")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.deb::$url/releases/download/v$pkgver/Google-Assistant-Setup-$pkgver-amd64.deb")
sha256sums=('97ef51b6950d14ac0bc34aa5705b125b09d67d0f5e5cafa686f7757ff751a510')
package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Google Assistant/${pkgname%-bin}" "$pkgdir/usr/bin/"
}