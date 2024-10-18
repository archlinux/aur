# Maintainer: Vladislav Litvinov <vlad@sek1.ro>
pkgname=libbasen
pkgver=1.1.0
pkgrel=3
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbasen"
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82ce7c424205b91118720b956f30ab211e7af2ebc50ba00f40ff3004f213cccf')
makedepends=('argparse')

build() {
    cd "$pkgname-$pkgver"
    make -j $(nproc) SHARED=
}

package() {
    cd "$pkgname-$pkgver"
    make i USRDIR=$pkgdir/usr
}
