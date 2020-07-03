# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>
pkgname=quarter
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Coin GUI binding for Qt."
arch=('x86_64')
url="https://github.com/coin3d/quarter"
license=('BSD')
groups=()
depends=('coin' 'qt5-base')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/coin3d/quarter/releases/download/Quarter-$pkgver/$pkgname-$pkgver-src.tar.gz")
noextract=()
md5sums=('68bbb69c370106ef4fbb62956c842c17')
validpgpkeys=()

build() {
    mkdir -p "$srcdir/build" && cd "$srcdir/build"
    cmake ../$pkgname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
