# Maintainer: Vladislav Litvinov <vlad@sek1.ro>
pkgname=libbasen
pkgver=1.0.2
pkgrel=1
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbasen"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b52d6d128f852f8dd5b2f7b7215b0b7d419ddf9279c1d0c50458402e68ee3480')

build() {
    cd "$pkgname-$pkgver"
    make -j $(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    make i USRDIR=$pkgdir/usr
}