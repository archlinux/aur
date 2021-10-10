# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=4.13
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=( 'gtk3' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'libappindicator-gtk3' 'libdbusmenu-glib' 'libgee' 'gsl' 'glibc' 'udisks2' 'rsync' )
makedepends=( 'vala' 'glibc' 'gtk3' 'libappindicator-gtk3' 'cairo' 'gdk-pixbuf2' 'libgee' 'glib2' 'gsl' 'pango' 'udisks2' 'cmake' 'gettext' 'pkg-config' 'gcc' 'make' 'intltool' )
source=(https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('cb830acc06f92e94f631cd24273657813dcf27d82641d1504bd0cc7bc2b16c951d68d317b1f6098b98ecd9169c705fb4dbe37b6a0022296e5eab9aa60b373c18')
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
