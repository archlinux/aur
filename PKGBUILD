# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=tcloo
pkgver=1.0.2
pkgrel=1
pkgdesc="Tcl extension for object oriented programming. Tcl 8.5 Only!!!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tcl/"
license=('GPL')
depends=('glibc' 'tcl85')
md5sums=(
'1f0d0a86cbbd4955450b42d754c29f15'
'e1a87ff1e902fd95434e5b8abe335258'
)

source=(
http://downloads.sourceforge.net/project/tcl/TclOO%20Package/$pkgver/TclOO$pkgver.tar.gz
configure.patch
)

build() {

    cd $srcdir/TclOO$pkgver
    patch -p0 <../configure.patch
    ./configure --prefix=/usr || return 1
    make || return 1

}

package() {

    cd $srcdir/TclOO$pkgver
    make DESTDIR=$pkgdir install || return 1
    #chmod 644 $pkgdir/usr/lib/TclOO0.6/libTclOOstub0.6.a

}
