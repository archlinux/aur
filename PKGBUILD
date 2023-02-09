# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=gosling-git
_pkgname=gosling
pkgver=r15.31f87c7
pkgrel=1
pkgdesc='Natural sounding text-to-speech in the terminal (and more).'
arch=('x86_64')
url='https://github.com/Samyak2/gosling'
makedepends=("go")
license=('MIT')
source=("git+https://github.com/Samyak2/gosling.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    go build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 gosling "$pkgdir"/usr/bin/gosling
}
