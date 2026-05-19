pkgname=azsh
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight CLI tool to access Azure Cloud Shell directly from your terminal"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=('azsh')
conflicts=('azsh')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('68bbcbd097a61555e9f8996bb24940195e3bee0c7b2783f6a88c0053f12bbada')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -ldflags="-s -w" -o azsh .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 azsh "$pkgdir/usr/bin/azsh"
}
