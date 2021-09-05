# Maintainer: Peter Kaplan <peter.kaplan@posteo.de>
pkgname=lswt
pkgver=r39.8da4dff
pkgrel=1
pkgdesc="List Wayland toplevels"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/lswt"
license=('GPL3')
makedepends=('git')
provides=("lswt")
source=("git+https://git.sr.ht/~leon_plickat/lswt")
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
    install -Dm755 lswt "$pkgdir/usr/bin/lswt"
    install -Dm644 lswt.1 "$pkgdir/usr/share/man/man1/lswt.1"
    install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/lswt"
}
