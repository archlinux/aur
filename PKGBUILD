# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=4.12.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=( 'gtk3' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'libappindicator-gtk3' 'libdbusmenu-glib' 'libgee' 'gsl' 'glibc' 'udisks2' 'rsync' )
makedepends=( 'vala' 'glibc' 'gtk3' 'libappindicator-gtk3' 'cairo' 'gdk-pixbuf2' 'libgee' 'glib2' 'gsl' 'pango' 'udisks2' 'cmake' 'gettext' 'pkg-config' 'gcc' 'make' 'intltool' )
source=(https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c4b5bb5ba37d105b51eccbc2b1fded6c1339129ec93c0c9a454e18306d8fef256d91d9b9a4dfe44ab2f2a690fc0b2057ac5fa46e2a108b8e484684c75da6133a')
install=${pkgname}.install

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install
}
