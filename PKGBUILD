# Maintainer: Stezkoy
# Maintainer: Mikhail Velichko  <efklid@gmail.com>

pkgname=vkplay-gamecenter-bin
pkgdesc='VK Play - online gaming service for game lovers, developers and content creators. The platform combines streaming, esports, a place for communication with like-minded users, a catalog of games and cloud gaming.'
pkgver=1.19
pkgrel=3
arch=('x86_64')
_url="vkplay.ru"
url="https://vkplay.ru/"
license=('ISC')
options=('!strip' '!debug' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=('alsa-lib' 'at-spi2-atk' 'cups' 'gtk3' 'mesa' 'nss')
source=("${pkgname}-${pkgver}.deb::https://static.gc.${_url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha512sums=('321003b155e08efb1c305a633af9914b4a76b5fb4d7d43fd44fd17dcd4c028f63d8d10878d5478aa8751f35490c7ab3a90f4977edb3e37f65e96d0f6411009aa')

prepare() {
  tar -xf data.tar.zst
}

package() {
  cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
