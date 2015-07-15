# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=mdp-git
_pkgname=mdp
pkgver=r228.fad6652
pkgrel=1
pkgdesc="A command-line based markdown presentation tool."
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=(GPL)
depends=('ncurses')
conflicts=('mdp')
makedepends=('gcc' 'make' 'binutils' 'git' 'ncurses')
source=('mdp::git+https://github.com/visit1985/mdp.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=4 sw=4 et:
