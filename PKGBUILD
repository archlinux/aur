# Maintainer: Alessandro Chitarrini <alessandro.chitarrini51@gmail.com>
pkgname=swtch
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimal terminal stopwatch"
arch=('x86_64' 'aarch64')
url="https://github.com/chitvs/swtch"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6dd7b97cca79d1b92213f6dffa3bb4a8ce08db2e05dbe741eb0d82cb25d774bf')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
