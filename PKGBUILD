# Maintainer: Szymon Scholz
# Contributor: Sean Bartell <yotann@yotann.org>
# Website and source removed from web, including archive.org sources
pkgname=nanopond
pkgver=1.9
pkgrel=2
pkgdesc="A teeny tiny artificial life virtual machine"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20171017223720/http://adam.ierymenko.name:80/nanopond.shtml"
license=('GPL')
depends=('sdl')
source=("$pkgname-$pkgver.c")

build() {
    # These are the flags recommended in the source file
    gcc $CFLAGS $(sdl-config --cflags --libs) \
        -O6 -funroll-loops -fomit-frame-pointer -ftree-vectorize \
        -o nanopond "$pkgname-$pkgver.c"
}

package() {
    mkdir -p $pkgdir/usr/bin
    install nanopond "$pkgdir/usr/bin"
}
md5sums=('92466a08c17618e53583003aa45a373f')
