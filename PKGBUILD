# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: Dany Martineau <dany.luc.martineau gmail com>

pkgname=chroma
pkgver=1.15
pkgrel=1
pkgdesc="Abstract puzzle game."
arch=('i686' 'x86_64')
url="http://www.level7.org.uk/chroma/"
license=('GPL')
depends=('sdl_image' 'ncurses' 'freetype2')
makedepends=('make' 'gettext')
source=("http://www.level7.org.uk/${pkgname}/download/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop")

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make DESTDIR=${pkgdir} install
    install -Dm644 ../${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

md5sums=('525ff7f06d43af04cc0bf318b6810c16'
         '90932d9a42f1545c3ba59ae38afb7732')
