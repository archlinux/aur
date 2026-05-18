pkgname=azsh
pkgver=0.1.0
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

sha256sums=('0e5ae371783b3747d545a680bacd3a3eaae8595f3f4b6b8039d0f6a8be0a997c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -ldflags="-s -w" -o azsh .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 azsh "$pkgdir/usr/bin/azsh"
}
