# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: <development[at]kondorgulasch[dot]de>

pkgname=pidgin-xmpp-receipts
pkgver=0.8
pkgrel=3
pkgdesc='This pidgin-plugin implements xmpp message delivery receipts (XEP-0184)'
url='https://devel.kondorgulasch.de/pidgin-xmpp-receipts/'
arch=('x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/noonien-d/pidgin-xmpp-receipts/archive/release_${pkgver}.tar.gz)
sha256sums=('0bceff237c6eb23e0564f7560d0ff491b37c01c8f6e3a3a7d8c4fdd6781d6524')
sha512sums=('04113236d46066211d7e0f3c66f4bf1b6fb8a33ac675203f3cff15300eb97ffd3ee627e03fcc3ab3d1e9431fc107a9f7e9fca319f3debb773603d311b167b5a8')

build() {
	cd ${pkgname}-release_${pkgver}
	make
}

package() {
  cd ${pkgname}-release_${pkgver}
  make DESTDIR="${pkgdir}" PLUGINDIR="/usr/lib/pidgin" install
}

# vim: ts=2 sw=2 et:
