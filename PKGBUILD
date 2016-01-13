# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=nsf
pkgver=2.0.0
pkgrel=1
pkgdesc="The Next Scripting Framework (for short: NSF) is an infrastructure
 for creating object-oriented scripting languages based on Tcl. This package
 provides two object-orientated extensions for Tcl, NX and XOTcl2."
arch=('x86_64')
url="https://next-scripting.org"
license=('MIT')
depends=(tcl)
conflicts=(xotcl)
source=("http://downloads.sourceforge.net/project/next-scripting/${pkgver}/nsf${pkgver}.tar.gz")
md5sums=("1ce375a3c73338d3a784f5245beaba9e")

build() {
    cd nsf${pkgver}
    ./configure 
make
}

package() {
    cd nsf${pkgver}
    make install DESTDIR=${pkgdir}
    #fix broken symlink
    ln -sf /usr/lib/nsf${pkgver}/libnsf${pkgver}.so  ${pkgdir}/usr/lib/libnsf${pkgver}.so
}

