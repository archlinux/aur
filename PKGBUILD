# Maintainer: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

pkgname=sshs
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Terminal user interface for SSH"
arch=('any')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('openssh')
makedepends=('go')
source=("https://github.com/quantumsheep/sshs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3982f7ca8eb459548a74b044a32c28d90f0e78506044d5ecbc9751c9d3dd327d')

build() {
    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
