# Maintainer: Limehawk <limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('095684ca8fbf3a029602eb4ebe589a9065b9b6fae9b8ea2b1f1c0b2ca184330e')

build() {
    cd "$pkgname-$pkgver"
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/lazyreno
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
