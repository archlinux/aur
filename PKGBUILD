# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=pgquarrel-git
pkgver=0.7.0.r33.gd4bfeb6
pkgrel=1
pkgdesc="A program that compares PostgreSQL database schemas (DDL)"
arch=('x86_64' 'i686')
url="https://github.com/eulerto/pgquarrel"
license=('BSD')
makedepends=('cmake' 'postgresql-libs')
conflicts=('pgquarrel')
provides=('pgquarrel')
source=("pgquarrel::git+https://github.com/eulerto/pgquarrel.git")
sha256sums=('SKIP')

pkgver() {
    cd pgquarrel
    git describe --long --tags | sed 's/pgquarrel_//;s/\([^-]*-g\)/r\1/;s/[-|_]/./g'
}

build() {
    cd pgquarrel
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_PREFIX_PATH=/usr .
    make
}

package() {
    cd pgquarrel
    make install
}
