# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: <development[at]kondorgulasch[dot]de>

pkgname=pidgin-xmpp-receipts
pkgver=0.6
pkgrel=2
pkgdesc="This pidgin-plugin implements xmpp message delivery receipts (XEP-0184)"
url="http://devel.kondorgulasch.de/pidgin-xmpp-receipts/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
source=(http://devel.kondorgulasch.de/pidgin-xmpp-receipts/files/pidgin-xmpp-receipts-${pkgver}.tar.gz);
sha512sums=('160270206d0d6394bddaa15ca59896756ab3a546f7c74cc9e3d4ec634f70b829ae3b013ee6086a5d4a5376b7d2b81341c44c3ef0ecab2a66d612b96fd37dfeff')

prepare() {
	cd ${pkgname}-${pkgver}
  sed -r 's|(CFLAGS)=|\1+=|g' -i Makefile
  sed -r 's|(LDFLAGS)=|\1+=|g' -i Makefile
}

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 xmpp-receipts.so -t "${pkgdir}/usr/lib/pidgin"
}

# vim: ts=2 sw=2 et:
