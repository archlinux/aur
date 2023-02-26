# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=trayer
pkgver=1.1.8
pkgrel=3
pkgdesc='lightweight GTK2-based systray for UNIX desktop'
url='https://github.com/sargon/trayer-srg'
arch=('x86_64')
license=('MIT')
depends=('gtk2')
makedepends=('libxmu')
provides=('trayer-srg')
conflicts=('trayer-srg')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sargon/trayer-srg/archive/trayer-${pkgver}.tar.gz)
sha512sums=('5ae92fdcee64ad1ca59846874dcd4bd4859adeeb80a86f1ed97d62e6306f8ec62d1ee26dba251257242dc25d158a6a550e69f2fcc8739242a2311e37fe1ce310')

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
