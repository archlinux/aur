# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: <development[at]kondorgulasch[dot]de>

pkgname=pidgin-xmpp-receipts
pkgver=0.6
pkgrel=3
pkgdesc="This pidgin-plugin implements xmpp message delivery receipts (XEP-0184)"
url="http://devel.kondorgulasch.de/pidgin-xmpp-receipts/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
source=(http://devel.kondorgulasch.de/pidgin-xmpp-receipts/files/pidgin-xmpp-receipts-${pkgver}.tar.gz
        makefile.patch)
sha512sums=('160270206d0d6394bddaa15ca59896756ab3a546f7c74cc9e3d4ec634f70b829ae3b013ee6086a5d4a5376b7d2b81341c44c3ef0ecab2a66d612b96fd37dfeff'
            '4dbc5dede45446339357908395ec8447c407c1c18af514cf67cb2b7cca372c95937c2a9c8edd032e20e8ab1cf5e74493f4f12c11af417d1b9af1aee4aae05859')

prepare() {
	cd ${pkgname}-${pkgver}
  patch -p1 < "${srcdir}/makefile.patch"
}

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" PLUGINDIR="/usr/lib/pidgin" install
}

# vim: ts=2 sw=2 et:
