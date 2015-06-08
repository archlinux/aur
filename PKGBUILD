# Contributor: Sean Bartell <yotann@yotann.org>
pkgname=nanopond
pkgver=1.9
pkgrel=1
pkgdesc="A teeny tiny artificial life virtual machine"
arch=('i686' 'x86_64')
url="http://adam.ierymenko.name/nanopond.shtml"
license=('GPL')
depends=('sdl')
source=("http://adam.ierymenko.name/files/$pkgname-$pkgver.c")
md5sums=('ff67c936ed47de3ea4a8a6653e54aad7')
sha512sums=('c4bed6fdaa90f830434a732b0c9f9f980154c20a26af55e54d50ddf9403dc020427b9cda8d52f6c864e691a67367d1051132762f6f7211d9c9bd7925bfacdf57')

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
