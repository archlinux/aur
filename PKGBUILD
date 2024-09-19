# Maintainer: Vlad Litvinov <vlad@sek1.ro>
pkgname=libbase
pkgver=1.0.0
pkgrel=1
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbase"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
makedepends=('gcc')

build() {
    cd "$pkgname-$pkgver"
    make -j $(nproc)
    make -j $(nproc) DEBUG=
}

package() {
    cd "$pkgname-$pkgver"
    make i USRDIR=$pkgdir/usr
}