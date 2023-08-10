# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=naviserver-tclthread
pkgver=2.8.8
pkgrel=1
pkgdesc="Provides tcl thread library for naviserver. You can use this extension to gain script-level access to Tcl threading capabilities."
_ns_install_dir="/usr/lib/naviserver"
arch=('x86_64')
url="http://tcl.sourceforge.net"
license=('custom')
depends=('tcl' 'naviserver')
source=("http://downloads.sourceforge.net/project/tcl/Thread%20Extension/${pkgver}/thread${pkgver}.tar.gz")
md5sums=("871a3029746d9a40913d78e7db46a81d")

build() {
    cd thread${pkgver}/unix
    ../configure --enable-threads --prefix=${_ns_install_dir} --exec-prefix=${_ns_install_dir} --with-naviserver=${_ns_install_dir} --with-tcl=/usr/lib
make
}

package() {
    cd thread${pkgver}/unix
    make install DESTDIR=${pkgdir}
}

