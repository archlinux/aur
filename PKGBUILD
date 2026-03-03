# Maintainer: Galaxy <me@galaxies.top>
_pkgname=bf
pkgname=$_pkgname-git
pkgver=v1.1.2.g3d1c0b0
pkgrel=1
pkgdesc="An enhanced visual Brainfuck interpreter with extended UTF-8 encoding support and additional pre-processing directives"
arch=('x86_64')
url="https://github.com/Galaxy-Suns/bf"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'sed' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/Galaxy-Suns/bf.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    cmake -G "Unix Makefiles" -B build -S .
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname"
    cmake --install build --prefix "$pkgdir/usr/local"
}
