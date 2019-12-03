# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=grip
pkgver=4.0.1
pkgrel=1
pkgdesc="A cd-player and ripper for the Gnome desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/grip/"
depends=('vte' 'curl' 'libgnomeui' 'id3lib' 'cdparanoia')
optdepends=('yelp: to display the help and notices')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('07e849ff7553f9a4ad5d7808a0f66623a6a2541e')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make CPPFLAGS="-Wno-deprecated-declarations"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
