pkgname=zrge
pkgver=1.0.1
pkgrel=1
pkgdesc="Zer Graphic Editor (zrge) is a simple raster graphic editor designed to work with the ZPIF, PNG, and JPEG formats."
arch=('x86_64')
url="https://github.com/ZerTeam/ZRGE"
license=('GPL3')
depends=(
 'sfml=2.6.2'
 'gcc'
)
source=("https://github.com/ZerTeam/ZRGE/archive/refs/tags/zrge1.0.1.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ZRGE-zrge1.0.1"
    g++ zrge.cpp -o zrge -lsfml-graphics -lsfml-window -lsfml-system -std=c++20
}

package() {
    cd "$srcdir/ZRGE-zrge1.0.1"
    install -Dm755 zrge "$pkgdir/usr/bin/zrge"
    install -Dm644 -t "$pkgdir/usr/share/zrge/images" images/*
}
