# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=pgquarrel
pkgver=0.7.0
pkgrel=1
pkgdesc="A program that compares PostgreSQL database schemas (DDL)"
arch=('x86_64' 'i686')
url="https://github.com/eulerto/pgquarrel"
license=('BSD')
makedepends=('cmake' 'postgresql-libs')
source=("pgquarrel-$pkgver.tar.gz::https://github.com/eulerto/pgquarrel/archive/refs/tags/pgquarrel_${pkgver//./_}.tar.gz")
sha256sums=('71adc5504b8facee4973cae8eec832a172a5d7f99495e445e2e025eb8209b2c3')

build() {
    cd pgquarrel-pgquarrel_*
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_PREFIX_PATH=/usr .
    make
}

package() {
    cd pgquarrel-pgquarrel_*
    make install
}
