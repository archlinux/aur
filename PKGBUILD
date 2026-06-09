pkgname=azsh
pkgver=0.2.0
pkgrel=1
pkgdesc="Access Azure Cloud Shell directly from your terminal"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=('azsh')
conflicts=('azsh')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('e299a5a000438739f934e3fcac70f00ae03843e905450dd0855b320869d949ca')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -ldflags="-s -w" -o azsh .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 azsh "$pkgdir/usr/bin/azsh"
}
