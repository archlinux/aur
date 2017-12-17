# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=trayer
pkgver=1.1.7
pkgrel=1
pkgdesc='lightweight GTK2-based systray for UNIX desktop'
url='https://github.com/sargon/trayer-srg'
arch=('x86_64')
license=('MIT')
depends=('gtk2')
makedepends=('libxmu')
provides=('trayer-srg')
conflicts=('trayer-srg')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sargon/trayer-srg/archive/trayer-${pkgver}.tar.gz)
sha512sums=('5bb049af01c3f3f62dc8a5c1932985b92c98e4e2083aebd1dc09256746e097239be54ebc739801773878882a5c8f168a4a13bdac292388f79079ad52c41b2cad')

build() {
  cd trayer-srg-${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd trayer-srg-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 man/trayer.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
