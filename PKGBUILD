pkgname=lemonpos
pkgver=0.9.4
pkgrel=rc7
pkgdesc="An open source Point of Sale software targeted for micro, small and medium businesses."
url="http://lemonpos.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=(http://downloads.sourceforge.net/project/lemonpos/citronic/${pkgname}-${pkgver}-${pkgrel}.tar.bz2)
md5sums=('4c45982ff54fdc04094a20f2feafc88f')
install=('lemonpos.install')
build() {
    cd ${srcdir}/${pkgname}/src
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    msg "Starting make..."
    make || return 1
    msg "Make successful, installIing..."
    make DESTDIR=${pkgdir} install || return 1
}
