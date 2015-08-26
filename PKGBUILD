# Original Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Current Maintainer: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libticalcs
pkgver=1.1.8
pkgrel=2
pkgdesc="TI Calculator library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL)
depends=(libticables libtifiles)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.17/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('a8286f8a2552bcad96beab99ce254e67b3dc1a03eb9d82f8de4bdf7b8efc3496')
sha512sums=('0e09148006f5ee227d1b347ef44a6e755cb1dd757b8ff99e0f006aec0bc37c40dc5e293e44a0d91fc966b47da9113b4f00a71d9d9aa5cfbea4b01487232c1c08')

build() {
    cd ${pkgname}2-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
}
