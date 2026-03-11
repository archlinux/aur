# Maintainer: Limehawk <limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('4c9c456c559242ccaf734e75de22f2827375fcec9ddaecf68ecb4457a557f06a')

build() {
    cd "$pkgname-$pkgver"
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/lazyreno
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
