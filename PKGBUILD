# Maintainer: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

pkgname=sshs
pkgver="2.1.2"
pkgrel="1"
pkgdesc="Terminal user interface for SSH"
arch=('any')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('openssh')
makedepends=('go')
source=("https://github.com/quantumsheep/sshs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cb89afe8e05f25e2eda79aae2e46a121371baf89bce4e4fbe16ba48a7d5337e0')

build() {
    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
