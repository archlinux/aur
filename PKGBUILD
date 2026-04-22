# Maintainer: Landon Porter <landonp95@gmail.com>

_pkgname=crain
pkgname="${_pkgname}-git"
pkgver=2026.4.22
pkgrel=1
pkgdesc="the worst storm this side of the silicon (terminal-based rain)"
url="https://github.com/mazylol/crain"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('ncurses')
makedepends=('git' 'clang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

build() {
    cd "$srcdir/${_pkgname}"
    gcc nob.c -o nob
    ./nob
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 build/"${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
