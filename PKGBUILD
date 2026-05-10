# Maintainer: FreeTazaPablo <www.pablo.taza.com@gmail.com>
pkgname=imate
pkgver=1.0
pkgrel=2
pkgdesc="A lightweight terminal text editor built on ncurses"
arch=('x86_64')
url="https://github.com/FreeTazaPablo/Imate"
license=('MIT')
depends=('ncurses')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeTazaPablo/Imate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('998c70edccf9e5c6134cdf6cf35b09dac759533486f7ca628165df4aeb5ffd58')

build() {
    cd "Imate-$pkgver"
    gcc -O2 -o imate imate.c -lncursesw
}

package() {
    cd "Imate-$pkgver"
    install -Dm755 imate "$pkgdir/usr/bin/imate"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
