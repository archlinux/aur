# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: meatballhat <daniel.buch@gmail.com>

pkgname=irssi-xmpp
pkgver=0.54
pkgrel=3
pkgdesc='irssi plugin to connect to the Jabber network'
url='https://cybione.org/~irssi-xmpp'
arch=('x86_64')
license=('GPL2')
depends=('glib2' 'loudmouth' 'irssi')
source=(https://github.com/cdidier/irssi-xmpp/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('31ddd9e0147eec23d08b8bcbe242e831d612cb2d00f3b56776e9d0b87db9bd76d4bb147422cdf18c0567f0e0463ab828ab7a0ef80a2b35cfdc0a8be962b39f14')

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr IRSSI_INCLUDE=/usr/include/irssi
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 README.md NEWS -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
