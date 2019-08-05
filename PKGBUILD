# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitomatic
pkgver=0.2
pkgrel=1
pkgdesc="A tool to monitor git repositories and automatically pull & push changes"
arch=('x86_64' 'i686')
url="https://github.com/muesli/gitomatic"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs' '!makeflags')
source=("$pkgname-$pkgver::git+https://github.com/muesli/gitomatic#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GO111MODULE=on
    cd "$srcdir"/$pkgname-$pkgver
    go build
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/gitomatic" "$pkgdir/usr/bin/gitomatic"
}

# vim:set ts=4 sw=4 et:
