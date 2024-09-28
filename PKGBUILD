# Maintainer: Vladislav Litvinov <vlad@sek1.ro>
pkgname=libbasen
pkgver=1.0.3
pkgrel=1
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbasen"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6abebd73fdc38211787fce8cf96e157f37c1d4e7902533ba78e0f6cd63fd24fc')

build() {
    cd "$pkgname-$pkgver"
    make -j $(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    make i USRDIR=$pkgdir/usr
}