# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=4.10.0.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=( 'gtk3' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'libappindicator-gtk3' 'libdbusmenu-glib' 'libgee' 'gsl' 'glibc' 'udisks2' 'rsync' )
makedepends=( 'vala' 'glibc' 'gtk3' 'libappindicator-gtk3' 'cairo' 'gdk-pixbuf2' 'libgee' 'glib2' 'gsl' 'pango' 'udisks2' 'cmake' 'gettext' 'pkg-config' 'gcc' 'make' 'intltool' )
source=(https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('49576714faf0e35d2bdc55aa8cfcd64771da28f90dd823a6cf0d293850153ed05fb91fae6b8ba8ac351499a960a9c13ea200cf8b2c5dee1ad2e6eaab7460a719')
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