# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=davtools
pkgver=1.2.0
pkgrel=3
pkgdesc="Disk Allocation Viewer(DAV) tools for Linux that can obtain the state of fragmentation on disk and visualize it."
url="https://sourceforge.net/projects/davtools/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('e2fsprogs')
install=
source=("https://downloads.sourceforge.net/project/davtools/davtools/Release 1.2.0/davl-${pkgver}.tar.bz2")
sha512sums=('7d5a663175eed45ee0921934dde8f747f4549f7f5d3f2f76041305ef4823525afad8a57f201ee30c7c0ab74795e7b6035bfa285da98c74bc809f84fcd1c44044')

build() {
    cd $srcdir/davl-$pkgver

    /bin/sed -i "s:/usr/local/:$pkgdir/usr/:" path_list
    /bin/sed -i "s:/lib/modules/:$pkgdir/lib/modules/:" path_list

    make
}

package() {
    cd $srcdir/davl-$pkgver

    make DESTDIR=$pkgdir install
}
