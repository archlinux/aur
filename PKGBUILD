# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libfreehand
pkgver=0.1.2
pkgrel=1
pkgdesc="Library for parsing Aldus/Macromedia/Adobe FreeHand documents"
arch=('i686' 'x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libfreehand"
license=('MPL2')
depends=('lcms2' 'librevenge')
makedepends=('doxygen' 'boost' 'gperf')
source=("https://dev-www.libreoffice.org/src/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0e422d1564a6dbf22a9af598535425271e583514c0f7ba7d9091676420de34ac')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-tests
	make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
