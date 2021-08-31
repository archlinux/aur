# Maintainer: Peter Kaplan <peter.kaplan@posteo.de>
pkgname=stacktile
pkgver=r30.95a061e
pkgrel=1
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git')
options=('!buildflags')
provides=("stacktile")
source=("git+https://git.sr.ht/~leon_plickat/stacktile")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 stacktile "$pkgdir/usr/bin/stacktile"
    install -Dm644 stacktile.1 "$pkgdir/usr/share/man/man1/stacktile.1"
}
