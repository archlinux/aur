# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=grip
pkgver=4.2.2
pkgrel=1
pkgdesc="A cd-player and ripper for the Gnome desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/grip/"
depends=('curl' 'id3lib' 'cdparanoia' 'gtk2')
makedepends=('pkgconfig' 'make')
optdepends=('yelp: to display the help and notices')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('69257a570beb0ed5d9e503134a4c65cc2ec7d3f3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
