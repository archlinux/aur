pkgname=imate
pkgver=1.0
pkgrel=4
pkgdesc="A lightweight terminal text editor built on ncurses"
arch=('x86_64')
url="https://github.com/FreeTazaPablo/Imate"
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=("git+https://github.com/FreeTazaPablo/imate.git")
sha256sums=('SKIP')

pkgver() {
    cd imate
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd imate
    gcc -O2 -o imate imate.c -lncursesw
}

package() {
    cd imate
    install -Dm755 imate "$pkgdir/usr/bin/imate"
}
