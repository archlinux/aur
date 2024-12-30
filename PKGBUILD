# Maintainer: Ural Kavraal <uralkemal@gmail.com>
pkgname=craftrogue
pkgver=latest
pkgrel=1
pkgdesc="A terminal-based game  where you kill monsters."
arch=('x86_64')
url="https://github.com/ural89/ConsoleCraftEngine"
license=('MIT')
depends=('gcc' 'make' 'cmake')
source=("$pkgname::git+$url.git#branch=AUR")  # Specify the branch here
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname/CraftRogue"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/$pkgname/CraftRogue/build"
    install -Dm755 "CraftRogue" "$pkgdir/usr/bin/craftrogue"
}

