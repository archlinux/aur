# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=fleng
pkgver=19
pkgrel=1
pkgdesc="A low level concurrent logic programming language descended from Prolog"
arch=('x86_64')
url="http://www.call-with-current-continuation.org/fleng/fleng.html"
license=("Public Domain")
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('gcc' 'make')
source=(http://www.call-with-current-continuation.org/fleng/fleng-${pkgver}.tgz)
sha256sums=('c5830d192ddabd9f49b11f24265487cfe0b65ec2e686c0cefca4ebe49aae44af')
internal="ad541cd5"

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
