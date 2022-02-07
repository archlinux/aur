# Maintainer: jabra98 <jabra98.gpg@gmail.com>
# Maintainer: jabra982 <jabra98.gpg@gmail.com>
pkgname=my_test_package_jabra
pkgver=1
pkgrel=1
pkgdesc="This is a test package"
arch=('x86_64')
url="http://example.com/"
license=('MIT')
depends=()
conflicts=()
makedepends=('gcc')
provides=()
source=('main.c')
sha256sums=('4d53fa2d64795547156fc26d8a7a4b0f6522da905662bf08f6eb0c749a5f3904')

build() {
    [ ! -d build ] && mkdir build
    cd build
    gcc -o app "$srcdir/main.c"
}

package() {
        cd "$srcdir/build"
        [ ! -d "$pkgdir/usr/bin" ] && mkdir -p $pkgdir/usr/bin
        install ./app "$pkgdir/usr/bin/."
}
