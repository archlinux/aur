# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=glow
pkgver=0.1.3
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64' 'i686')
url="https://github.com/charmbracelet/glow"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs' '!makeflags')
source=("$pkgname-$pkgver::git+https://github.com/charmbracelet/glow#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GO111MODULE=on
    cd "$srcdir"/$pkgname-$pkgver
    go build -ldflags "-s -w -X main.Version=$pkgver"
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/glow" "$pkgdir/usr/bin/glow"
}

# vim:set ts=4 sw=4 et:
