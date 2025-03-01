# Maintainer: Jorge Arévalo Fernández <jorjai@jorjai.net>

pkgname=bonk
pkgver=1.0.3
pkgrel=0
pkgdesc="A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics."
arch=('any')
url="https://github.com/KingJorjai/BONK"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KingJorjai/BONK/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("57ed80c2f100a43400143ede2105c92b97b38d819f101b8ff708afb5cdd820cd")

build() {
    cd "$srcdir/BONK-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -o "$pkgname"
}

package() {
    cd "$srcdir/BONK-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/BONK"
}

# vim:set ts=2 sw=2 et: