pkgname=azsh
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI client for Azure Cloud Shell"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=('azsh')
conflicts=('azsh')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('8e9a2c39a2526ad40fdf8f267566fed8f9f782332fb3363df95270380016f210')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -ldflags="-s -w" -o azsh .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 azsh "$pkgdir/usr/bin/azsh"
}
