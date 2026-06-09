# Maintainer: Stezkoy
# Maintainer: Mikhail Velichko  <efklid@gmail.com>

pkgname=vkplay-gamecenter-bin
pkgdesc='VK Play - online gaming service for game lovers, developers and content creators. The platform combines streaming, esports, a place for communication with like-minded users, a catalog of games and cloud gaming.'
pkgver=1.19
pkgrel=2
arch=('x86_64')
_url="vkplay.ru"
url="https://vkplay.ru/"
license=('ISC')
options=('!strip' '!debug' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=('alsa-lib' 'at-spi2-atk' 'cups' 'gtk3' 'mesa' 'nss')
source=("${pkgname}-${pkgver}.deb::https://static.gc.${_url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha512sums=('8efb14c1b39886569a3d913c48ad93754759008437636371fc56bbef0e7df1c08b972f33eb9b04f4a3e4195688f430f8c8d734b6f4d2112ab4718963dc22f736')

prepare() {
  tar -xf data.tar.zst
}

package() {
  cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
