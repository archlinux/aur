# Maintainer: Alessandro Scala <alessandro [dot] scala [eight][at] gmail [dot] com>
pkgname=perk-opam-git
pkgver=r112.7d00ffc
pkgrel=1
pkgdesc="A modern, ergonomic, low level programming language. Using opam for dependencies."
arch=('x86_64')
url="https://perklang.org/"
license=()
depends=('gcc' 'ctags')
makedepends=('git' 'opam')
provides=('perk')
conflicts=('perk')
source=("git+https://github.com/Alex23087/Perk.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Perk"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Perk"

    make deps
}

build() {
    cd "$srcdir/Perk"
    
    make build
}

check() {
    cd "$srcdir/Perk"
}

package() {
    cd "$srcdir/Perk"
    
    install -Dm755 "_build/default/bin/perkc.exe" "$pkgdir/usr/bin/perkc"
}
