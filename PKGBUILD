# Maintainer: m5rcel <ilovewomenfrom@asia.com>
pkgname=mspace-git
pkgver=2.1
pkgrel=1
pkgdesc="M-SPACE - Enhanced Solar System Simulator"
arch=('x86_64')
url="https://github.com/m4rcel-lol/mspace"
license=('MIT')
depends=('raylib')
makedepends=('git' 'gcc')
source=("git+https://github.com/m4rcel-lol/mspace.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/mspace"
    g++ main.cpp -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o mspace
}

package() {
    cd "$srcdir/mspace"
    install -Dm755 mspace "$pkgdir/usr/bin/mspace"
    install -Dm644 resources/*.png -t "$pkgdir/usr/share/mspace/resources/"
}
