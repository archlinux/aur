# Maintainer: Wilhem Barbier <wilhem.b@free.fr>
pkgname=raylib
pkgver=1.7.0
pkgrel=1
pkgdesc="raylib is a simple and easy-to-use library to learn videogames programming".
arch=('i686' 'x86_64')
url="http://raylib.com"
license=('ZLIB')
depends=('libxrandr')
source=("https://github.com/raysan5/raylib/archive/$pkgver.tar.gz")
md5sums=('87a8c073afbf4c6e7e0adf1479e1437e')

build() {
    cd "$pkgname-$pkgver/src"
    make PLATFORM=PLATFORM_DESKTOP SHARED_RAYLIB=YES
}

package() {
    mkdir -p "$pkgdir/usr/include"
    mkdir "$pkgdir/usr/lib"
    cd "$pkgname-$pkgver/release/linux"
    cp raylib.h "$pkgdir/usr/include/"
    cp libraylib.so "$pkgdir/usr/lib/"
}
