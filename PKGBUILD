# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=garden
pkgver=1.0.8
pkgrel=4
pkgdesc="Garden of coloured lights, a game by Linley Henzell, is a vertical shoot-em-up that is a piece of art"
arch=('i686' 'x86_64')
url="http://garden.sourceforge.net"
license=('GPL3')
depends=('allegro4' 'hicolor-icon-theme')
provides=('garden')
install=garden.install
source=(http://sourceforge.net/projects/garden/files/garden/${pkgver}/garden-${pkgver}.tar.gz)
md5sums=('42966f2c457d71a3ff0dd30522801ade')

build() {
    cd ${srcdir}/garden-${pkgver}
    LIBS="$LIBS -lm" ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/garden-${pkgver}
    make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=4 et:

