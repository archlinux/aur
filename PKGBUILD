# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=docker-backup
pkgver=0.2.1
pkgrel=1
pkgdesc="A tool to create & restore complete, self-contained backups of Docker containers"
arch=('x86_64' 'i686')
url="https://github.com/muesli/docker-backup"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs' '!makeflags')
source=("$pkgname-$pkgver::git+https://github.com/muesli/docker-backup#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GO111MODULE=on
    cd "$srcdir"/$pkgname-$pkgver
    go build
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/docker-backup" "$pkgdir/usr/bin/docker-backup"
}

# vim:set ts=4 sw=4 et:
