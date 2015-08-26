# Maintainer: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libtifiles
pkgver=1.1.6
pkgrel=2
pkgdesc="TI File format library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
depends=(libticonv)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.17/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('ec4d6acd1d135ee04256d04a5e1512c1ccaf82ad01e48f5e24d5c4da31ce898f')
sha512sums=('abc40275e7af921a67b658c6b6aa8ec511e965a3e9e00fcdc676c2b85e1d95dbae0f118e127e0806950d26afde9949251e47eb85af04d8f8ecca777dc3afcd23')

build() {
    cd ${pkgname}2-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
}
