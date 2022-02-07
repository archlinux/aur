# Maintainer: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

pkgname=sshs
pkgver="1.5.0"
pkgrel="1"
pkgdesc="Terminal user interface for SSH"
arch=('any')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('go' 'openssh')
source=("https://github.com/quantumsheep/sshs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('74edb1b69d83ed4de2d020e468ff7c4602a2857a821711f4454466417b069b7c')

build() {
    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
