pkgname=zrge
pkgver=1.0.0
pkgrel=2
pkgdesc="Zer Graphic Editor (zrge) is a simple raster graphic editor designed to work with the ZPIF, PNG, and JPEG formats."
arch=('x86_64')
url="https://github.com/ZerTeam/ZRGE"
license=('GPL3')
depends=(
 'sfml=2.6.2'
 'gcc'
)
source=("git+https://github.com/ZerTeam/ZRGE.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ZRGE"
    g++ zrge.cpp -o zrge -lsfml-graphics -lsfml-window -lsfml-system -std=c++20
}

package() {
    cd "$srcdir/ZRGE"
    install -Dm755 zrge "$pkgdir/usr/bin/zrge"
    install -Dm644 -t "$pkgdir/usr/share/zrge/images" images/*
}
