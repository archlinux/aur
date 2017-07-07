# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libfreehand
pkgver=0.1.1
pkgrel=2
pkgdesc="Library for parsing Aldus/Macromedia/Adobe FreeHand documents"
arch=('i686' 'x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libfreehand"
license=('MPL 2.0')
depends=('boost-libs' 'icu' 'lcms2' 'librevenge' 'zlib')
makedepends=('doxygen' 'boost' 'gperf')
source=("https://dev-www.libreoffice.org/src/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ec6676d0c63f7feac7801a1fe18dd7abe9044b39c3882fc99b9afef39bdf1d30')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
	make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
