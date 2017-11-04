# Maintainer: Wilhem Barbier <wilhem.b@free.fr>
pkgname=raylib
pkgver=1.8.0
pkgrel=1
pkgdesc="raylib is a simple and easy-to-use library to learn videogames programming".
arch=('i686' 'x86_64')
url="http://raylib.com"
license=('ZLIB')
depends=('libxrandr' 'glfw' 'openal')
source=("https://github.com/raysan5/raylib/archive/$pkgver.tar.gz")
md5sums=('663d11c68682a089b6015d918bedf7e7')

build() {
    cd "$pkgname-$pkgver/src"
    make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED
}

package() {
    mkdir -p "$pkgdir/usr/include"
    mkdir "$pkgdir/usr/lib"
    cd "$pkgname-$pkgver/release"
    cp include/raylib.h "$pkgdir/usr/include/"
    cp libs/linux/libraylib.so "$pkgdir/usr/lib/"
}
