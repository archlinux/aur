# Maintainer: Stezkoy
# Maintainer: Mikhail Velichko  <efklid@gmail.com>

pkgname=vkplay-gamecenter-bin
pkgdesc='VK Play - online gaming service for game lovers, developers and content creators. The platform combines streaming, esports, a place for communication with like-minded users, a catalog of games and cloud gaming.'
pkgver=1.16
pkgrel=2
arch=('x86_64')
url="vkplay.ru"
license=('ISC')
options=('!strip' '!debug' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=('alsa-lib' 'at-spi2-atk' 'cups' 'gtk3' 'mesa' 'nss')
source=("${pkgname}-${pkgver}.deb::https://static.gc.${url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha512sums=('414b85f284b8327d86f72ec677a7e1762af24c1242dd791404e6f1d01a40231c00681a46737a926877b2b1652b42447ebcfacc450f537fb7e6f58ee35c979798')

prepare() {
  tar -xf data.tar.zst
}

package() {
  cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
