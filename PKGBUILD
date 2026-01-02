# Maintainer: gorciu <gorciuyt@gmail.com>

pkgname=ghla
pkgver=2
pkgrel=1
pkgdesc="GHLA is a language level higher than Assembly"
arch=('x86_64')
url="https://github.com/gorciu-official/ghla"
license=('GPL-3.0-only')

makedepends=('make' 'gcc' 'binutils')
depends=('nasm')

source=("ghla-${pkgver}::git+https://github.com/gorciu-official/ghla.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ghla-${pkgver}"
    make
}

package() {
    cd "$srcdir/ghla-${pkgver}"

    install -Dm755 ghla.bin "$pkgdir/usr/bin/ghlac"
}