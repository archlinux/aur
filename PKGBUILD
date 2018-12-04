# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libquvi0.4
_srcname=libquvi
pkgver=0.4.1
pkgrel=2
pkgdesc='Library for parsing flash media stream URLs with C API (version 0.4)'
arch=('i686' 'x86_64')
url='http://quvi.sourceforge.net/'
license=('LGPL2.1')
depends=('libquvi-scripts0.4' 'curl' 'lua')
provides=('libquvi')
conflicts=('libquvi')
source=("https://sourceforge.net/projects/quvi/files/0.4/libquvi/${_srcname}-${pkgver}.tar.xz")
sha256sums=('b5862f7e5fa6ed7defd169adb5c7586c6406af86e029671fd09615f6eb7aa903')

build() {
    cd "$_srcname"-"$pkgver"
    
    ./configure --prefix='/usr'
    
    make
}

package() {
    cd "$_srcname"-"$pkgver"
    
    make DESTDIR="$pkgdir" install
}
