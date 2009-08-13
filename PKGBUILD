# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=davtools
pkgver=1.2.0
pkgrel=2
pkgdesc="Disk Allocation Viewer(DAV) tools for Linux that can obtain the state of fragmentation on disk and visualize it."
url="http://sourceforge.net/projects/davtools/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('e2fsprogs')
install=
source=(http://dl.sourceforge.net/sourceforge/davtools/davl-$pkgver.tar.bz2)
md5sums=('2c58b1f484b0197903f4cf4ee1fc3464')

build() {
    cd $startdir/src/davl-$pkgver

    /bin/sed -i "s:/usr/local/:$startdir/pkg/usr/:" path_list
    /bin/sed -i "s:/lib/modules/:$startdir/lib/modules/:" path_list

    make || return 1
    make DESTDIR=$startdir/pkg install
}
