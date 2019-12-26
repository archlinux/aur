# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=glow
pkgver=0.1.3
pkgrel=2
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64' 'i686')
url="https://github.com/charmbracelet/glow"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs' '!makeflags')
source=("https://github.com/charmbracelet/glow/archive/v${pkgver}.tar.gz")
sha256sums=('3c7e531bb2b04c62f302dd84547493c73fa1fc5c83282fa23405a5da82182797')

build() {
    export GO111MODULE=on
    cd "$srcdir/$pkgname-$pkgver"
    go build -ldflags "-s -w -X main.Version=$pkgver"
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/glow" "$pkgdir/usr/bin/glow"
}

# vim:set ts=4 sw=4 et:
