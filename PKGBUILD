pkgname=lexido
pkgver=1.4.2
pkgrel=1
arch=('any')
url="https://github.com/micr0-dev/lexido"
license=('GAPL')
makedepends=('go')
source=("https://github.com/micr0-dev/lexido/archive/refs/tags/v1.4.2.tar.gz")
sha256sums=('SKIP')

build() {
    export CGO_ENABLED=1
    export CC=gcc
    cd "$srcdir/lexido-$pkgver"
    /usr/bin/go build -o "$pkgname"
}

package() {
    install -Dm755 "$srcdir/lexido-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
