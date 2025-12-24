# Maintainer: TheRealOwenJ <therealowenj@proton.me>

pkgname=trbbfi-git
pkgver=17
pkgrel=1
pkgdesc="The Really Better Brainfuck Interpreter (git version)"
arch=('x86_64')
url="https://github.com/TheRealOwenJ/trbbfi"
license=('GPL3')
depends=('gcc')
makedepends=('git' 'make')
source=("git+https://github.com/TheRealOwenJ/trbbfi.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/trbbfi"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/trbbfi"
    make release
}

package() {
    cd "$srcdir/trbbfi"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
