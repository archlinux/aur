# Maintainer: pyndys
pkgname=ggf
pkgver=0.3.1
pkgrel=1
pkgdesc="Great Go Fetch (ggf) - fast system info fetch utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/pyndys/ggf"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyndys/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -v \
        -ldflags="-s -w -X main.version=$pkgver" \
        -o "$pkgname" \
        .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
b2sums=('4e4680d9bb145d4e52bf4b9176814d47e6cee3b232038482bb68784f7a10d5751860b2d1967e2920a4e8839b3d3920f0d2d4675dea8e6d3332a6b8997938341a')
