# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=mastotool
pkgver=0.1
pkgrel=1
pkgdesc="a collection of tools to work with your Mastodon account"
arch=('x86_64' 'i686')
url="https://github.com/muesli/mastotool"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs' '!makeflags')
source=("$pkgname-$pkgver::git+https://github.com/muesli/mastotool#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GO111MODULE=on
    cd "$srcdir"/$pkgname-$pkgver
    go build
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/mastotool" "$pkgdir/usr/bin/mastotool"
}

# vim:set ts=4 sw=4 et:
