# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: <development[at]kondorgulasch[dot]de>

#TODO
pkgname=pidgin-xmpp-receipts
pkgver=0.7
pkgrel=1
pkgdesc="This pidgin-plugin implements xmpp message delivery receipts (XEP-0184)"
url="http://devel.kondorgulasch.de/pidgin-xmpp-receipts/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/noonien-d/pidgin-xmpp-receipts/archive/release_${pkgver}.tar.gz)
sha512sums=('3aa9c8defaac784a05e9d2cd8a315c951e5f2d09a8471e16d7d50644d9bc94bd81ac2e64563b7e20ea2b98cd699310a6dbcb3e05b459f32bee43e45e60bc5c20')

build() {
	cd ${pkgname}-release_${pkgver}
	make
}

package() {
  cd ${pkgname}-release_${pkgver}
  make DESTDIR="${pkgdir}" PLUGINDIR="/usr/lib/pidgin" install
}

# vim: ts=2 sw=2 et:
