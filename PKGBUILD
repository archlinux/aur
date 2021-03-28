# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=jngl
pkgver=1.5.0
pkgrel=1
pkgdesc="One of the easiest 2D game libraries for C++ and Python"
arch=('i686' 'x86_64')
url="https://bixense.com/jngl/"
license=('ZLIB')
depends=('sdl2' 'fontconfig' 'libepoxy' 'libwebp' 'openal' 'libvorbis' 'boost')
makedepends=('meson' 'ninja')
source=("https://github.com/jhasse/jngl/archive/v$pkgver.tar.gz")
md5sums=('16072572c932a280bf36a3b4217f87c0')

build() {
    cd $srcdir/jngl-$pkgver
    mkdir -p build
    cd build
    meson .. --prefix=${pkgdir}/usr
}
package() {
    cd $srcdir/jngl-$pkgver/build
    ninja install
}
