# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20231206
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('x86_64')
url="https://github.com/petere/pguint"
license=('PostgreSQL')
depends=('glibc' 'postgresql')
makedepends=('clang' 'llvm' 'python')
source=("pguint-${pkgver}.tar.gz::https://github.com/petere/pguint/archive/$pkgver.tar.gz")
sha256sums=('dde9e193527d7216f2bcf2141b132e854e51c5674cf6a7a227ea76d206e46307')

build() {
    cd "pguint-$pkgver"
    make
}

package() {
    cd "pguint-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
