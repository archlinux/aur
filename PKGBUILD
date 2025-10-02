# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=epplet-base
pkgver=0.17
pkgrel=1
pkgdesc="Addon plugins for the enlightenment windowmanager"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL-1.0-or-later')
depends=('imlib2' 'libcdaudio' 'libgl')
makedepends=('mesa')
options+=('!debug')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/e16-epplets-${pkgver}.tar.gz)
sha512sums=('a3d366ee673b4c972d36e1ae26bdb47c282d0f2c30e50910620a9061c619e9d83d44b1e1990eff7ad872d723adac7fd87d4fee5c4d14dfb77874eb5e58bcbbb6')

build() {
  cd e16-epplets-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd e16-epplets-${pkgver}
  make DESTDIR="${pkgdir}" install
}
