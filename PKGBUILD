# Maintainer: Vladislav Litvinov <vlad@sek1.ro>
pkgname=libbasen
pkgver=1.1.1
pkgrel=1
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbasen"
license=('LGPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('efdf0413eeba77358e81acfc0ca6df6d513e8379540fc278a57494295564c6e7')
makedepends=('argparse' 'meson')

build() {
    cd "$pkgname-$pkgver"
    meson setup build --buildtype=release --prefix=/usr
    cd build
    meson compile
}

package() {
    cd "$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" meson install
}
