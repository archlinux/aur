# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=4.6.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=( 'gtk3' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'libappindicator-gtk3' 'libdbusmenu-glib' 'libgee' 'gsl' 'glibc' 'udisks2' 'rsync' )
makedepends=( 'vala' 'glibc' 'gtk3' 'libappindicator-gtk3' 'cairo' 'gdk-pixbuf2' 'libgee' 'glib2' 'gsl' 'pango' 'udisks2' 'cmake' 'gettext' 'pkg-config' 'gcc' 'make' 'intltool' )
source=(https://gitlab.com/rastersoft/${pkgname}/-/archive/4.6.0/${pkgname}-${pkgver}.tar.gz)
sha512sums=('de1bc35be52af3aae212b612434a03a23cb0df67ae9c665a20d3a333c2e244125b4195bcabd15d0e0a39212c5213d9319222a0d9cd7d136d56750df8aa6fe1db')
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