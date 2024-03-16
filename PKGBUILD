# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=fleng
pkgver=20
pkgrel=1
pkgdesc="A low level concurrent logic programming language descended from Prolog"
arch=('x86_64')
url="http://www.call-with-current-continuation.org/fleng/fleng.html"
license=("Public Domain")
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('gcc' 'make')
options=('!strip')
source=(http://www.call-with-current-continuation.org/fleng/fleng-${pkgver}.tgz)
sha256sums=('924a2e0cd6dd54613bbec926bbc908480fd11c819e779bcb63f721e2a81ec378')
internal="4a390575"

build() {
    cd $srcdir/fleng-$pkgver-$internal
    # patch -u < "${srcdir}/fix-build.patch"
    ./configure
    make
}

check() {
    cd $srcdir/fleng-$pkgver-$internal
    make check
}

package() {
    cd $srcdir/fleng-$pkgver-$internal
    make DESTDIR=$pkgdir install
}
