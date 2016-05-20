# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cotton-git
pkgver=r58.f9d7ded
pkgrel=1
pkgdesc="A process sandbox written in C++ "
arch=('i686' 'x86_64')
url="https://github.com/algorithm-ninja/cotton.git"
license=('APACHE2')
depends=('boost-libs')
makedepends=('boost' 'cmake')
options=()
source=("git+https://github.com/algorithm-ninja/cotton.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/cotton"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/cotton/build"
    cmake ..
    make
}

package() {
    cd "$srcdir/cotton/build"
    install -Dm755 cotton "$pkgdir/usr/bin/cotton"
    chmod +s "$pkgdir/usr/bin/cotton"
}
