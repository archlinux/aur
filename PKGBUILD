# Maintainer: Brian Steffens <briansteffens@gmail.com>
pkgname=vex
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Executes all permutations of a shell command with a pattern syntax"
arch=('i686' 'x86_64')
url="https://github.com/briansteffens/vex"
license=('GPL')
groups=()
depends=()
makedepends=("rust" "cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-*}::git+https://github.com/briansteffens/vex.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
