pkgname="xburst-tools"
pkgver=201206
pkgrel=1
pkgdesc="A collection of boot and flash tools for XBurst devices."
arch=('i686' 'x86_64')
url="http://projects.qi-hardware.com/index.php/p/xburst-tools/"
license=('GPL')
depends=('confuse' 'libusb' 'cross-mipsel-linux-gnu-gcc')
source=("http://projects.qi-hardware.com/media/upload/xburst-tools/files/${pkgname}_${pkgver}.tar.bz2")
md5sums=('b36369779a18d25fdd597ce5c86da1df')

build() {
    ./autogen.sh

    cd "$srcdir"
    ./configure --exec-prefix=/usr --prefix=/usr --sysconfdir=/etc CROSS_COMPILE="mipsel-linux-gnu-"
    make
}
package() {
    cd "$srcdir"

    make DESTDIR="$pkgdir/" install
}
