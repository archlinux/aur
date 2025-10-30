# Maintainer: lucas <lucas.bmior@gmail.com>

pkgname="brn2-git"
pkgver=r1758.a3f1775
pkgrel=1
pkgdesc="fast bulk renamer with swapping"
arch=(x86_64)
url='https://github.com/lucas-mior/brn2'
groups=()
license=(AGPL)
depends=()
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./build.sh
}

check() {
    cd "$srcdir/${pkgname%-git}"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    export DESTDIR="$pkgdir/" 
    export PREFIX="/usr"
    ./build.sh install
}
