# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=grip
pkgver=3.6.1
pkgrel=1
pkgdesc="A cd-player and ripper for the Gnome desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/grip/"
depends=('vte' 'curl' 'libgnomeui' 'id3lib' 'cdparanoia')
optdepends=('yelp: to display the help and notices')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('c7ad80476f35d2d966458995c34660452c24225a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
