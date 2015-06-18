# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: meatballhat <daniel.buch@gmail.com>

pkgname=irssi-xmpp
pkgver=0.52
pkgrel=2
pkgdesc="irssi plugin to connect to the Jabber network"
url="http://cybione.org/~irssi-xmpp"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('loudmouth' 'irssi' 'libidn')
source=(${pkgname}-${pkgver}.tar.gz::http://cybione.org/~irssi-xmpp/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('27f7b877d02e0812b59e9f23ee12e58b842e3923ab5f0aa8cdf874dc9b30d9d22dbae9ef848ee5ffe2dcb667a0344f960125a3ffc072ce065e1fdf714eb98b27')

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
