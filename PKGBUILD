# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=davtools
pkgver=1.2.0
pkgrel=3
pkgdesc="Disk Allocation Viewer(DAV) tools for Linux that can obtain the state of fragmentation on disk and visualize it."
url="http://sourceforge.net/projects/davtools/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('e2fsprogs')
install=
source=("http://downloads.sourceforge.net/project/davtools/davtools/Release 1.2.0/davl-${pkgver}.tar.bz2")
md5sums=('2c58b1f484b0197903f4cf4ee1fc3464')

build() {
    cd $srcdir/davl-$pkgver

    /bin/sed -i "s:/usr/local/:$pkgdir/usr/:" path_list
    /bin/sed -i "s:/lib/modules/:$pkgdir/lib/modules/:" path_list

    make || return 1
    make DESTDIR=$pkgdir install
}
