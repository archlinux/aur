# Maintainer: Salvador Pardiñas <darkfm AT vera DOT com DOT uy>
pkgname=cake-git
pkgver=r225.2bef53e
pkgrel=1
epoch=1
pkgdesc="C23 to C99 transpiler"
arch=("x86_64" "aarch64")
url="https://github.com/thradams/cake"
license=('GPL3')
groups=()
depends=()
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/thradams/cake.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
    cd "cake/src"
    gcc build.c -o build
}

build() {
    cd "cake/src"
    ./build
}

package() {
    cd "cake/src"
    install -D -m755 cake "$pkgdir/usr/bin/cake"
}

pkgver() {
    cd cake
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
