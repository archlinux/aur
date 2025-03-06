# Maintainer: Jorge Arévalo Fernández <jorjai@jorjai.net>

pkgname=bonk
pkgver=1.1.0
pkgrel=0
pkgdesc="A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics."
arch=('any')
url="https://github.com/KingJorjai/BONK"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KingJorjai/BONK/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("cf77ad481dab7be600419c08e54efdbfa55b1a7530327b75180f1e83c9e9b0a8")

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