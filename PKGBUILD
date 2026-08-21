# Maintainer: Stezkoy
# Maintainer: Mikhail Velichko  <efklid@gmail.com>

pkgname=vkplay-gamecenter-bin
pkgdesc='VK Play - online gaming service for game lovers, developers and content creators. The platform combines streaming, esports, a place for communication with like-minded users, a catalog of games and cloud gaming.'
pkgver=1.21
pkgrel=1
arch=('x86_64')
_url="vkplay.ru"
url="https://vkplay.ru/"
license=('ISC')
options=('!strip' '!debug' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=('alsa-lib' 'at-spi2-atk' 'cups' 'gtk3' 'mesa' 'nss')
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://static.gc.${_url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha256sums=('ed921cd130ae83d78386ba6d53c19d2d0f02e4d04a6255b08d86a565c0ae7637')

prepare() {
  tar -xf data.tar.zst
}

package() {
  cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
