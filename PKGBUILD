# Original Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Current Maintainer: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libticalcs
pkgver=1.1.9
pkgrel=1
pkgdesc="TI Calculator library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL)
depends=(libticables libtifiles)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('76780788bc309b647f97513d38dd5f01611c335a72855e0bd10c7bdbf2e38921')
sha512sums=('a55fa92df787929397f4ed3e8f922355f71c7883459ceb98fbb8d39d18f06441147188aaabf7a67083d70549443e439744e68527742e2b7b5d3d2838cc41b4da')

build() {
    cd ${pkgname}2-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
}
