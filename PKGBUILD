# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: meatballhat <daniel.buch@gmail.com>

pkgname=irssi-xmpp
pkgver=0.53
pkgrel=2
pkgdesc="irssi plugin to connect to the Jabber network"
url="http://cybione.org/~irssi-xmpp"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('loudmouth' 'irssi')
source=(${pkgname}-${pkgver}.tar.gz::http://cybione.org/~irssi-xmpp/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('09969db01b77e95248a080599d480b8271dcbe6d42bc90e5e2bb304a2d1b9695b70090ef0a6b7342bf6e17326e0f7a50c11c85e02e6ed742ec55820ffad655be')

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr IRSSI_INCLUDE=/usr/include/irssi
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
