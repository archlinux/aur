# Maintainer: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libtifiles
pkgver=1.1.7
pkgrel=1
pkgdesc="TI File format library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
depends=(libarchive libticonv)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('9ac63b49e97b09b30b37bbc84aeb15fa7967bceb944e56141c5cd5a528acc982')
sha512sums=('e2ef4de0ce8c78f0da4098ec618a7194f9b94a028f9cb54a0ea1c29c00028d7cf144a067d8aaf8010ad094378b6426d05621d530cfbfa05f793f6c1ed41fcaef')

build() {
    cd ${pkgname}2-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
}
