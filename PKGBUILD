# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Simo Leone <simo@archlinux.org>

pkgname=libticonv
pkgver=1.1.4
pkgrel=2
pkgdesc="TI character set conversion library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.17/$pkgname-$pkgver.tar.bz2)
sha256sums=('1faecc71311bd95c94792cc72dd0844e7881a65156b006f045bb417eddd45183')
sha512sums=('15ceb5acff888c841febc0d3ae96e3df649cce302b4ae2dc4ca150e3cb483337548fff0b32f0308bc759a08e6a167beaa8a2a4349f8ce47a2a7b62755a601018')

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
