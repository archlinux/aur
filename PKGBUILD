pkgname=guifinder
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI утилита для просмотра открытых X11 окон"
arch=('x86_64')
url="https://github.com/Amir22we/GUIFinder"
license=('MIT')
depends=('libx11')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Amir22we/GUIFinder/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "GUIFinder-$pkgver"
    g++ main.cpp -lX11 -o guifinder
}

package() {
    cd "GUIFinder-$pkgver"
    install -Dm755 guifinder "$pkgdir/usr/bin/guifinder"
}