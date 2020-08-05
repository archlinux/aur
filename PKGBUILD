# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-faustgen
pkgver=0.1.2
pkgrel=2
pkgdesc="The FAUST compiler embedded in a Pd external"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/CICM/$pkgname"
depends=('pd' 'llvm-libs')
makedepends=('cmake' 'llvm')
source=("https://github.com/CICM/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('2a9d0c3bfc668664a9010d7e3b7b9b19')

build() {
     cd "$pkgname-$pkgver"
     mkdir build && cd build
     cmake ..
     make
}

package() {
     cd "$pkgname-$pkgver"
     mkdir -p "$pkgdir/usr/lib/pd/extra/faustgen~/libs"
     cp -a external/* "$pkgdir/usr/lib/pd/extra/faustgen~"
     cp -a faust/libraries/*.lib faust/libraries/old/*.lib "$pkgdir/usr/lib/pd/extra/faustgen~/libs"
}
