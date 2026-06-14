pkgname=azsh
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI client for Azure Cloud Shell."
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=('azsh')
conflicts=('azsh')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('6c5ae84a3f4727b8703f5d6cd58b4355abc554a15684d6a5b3e4e8aa0ec20838')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -ldflags="-s -w" -o azsh .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 azsh "$pkgdir/usr/bin/azsh"
}
