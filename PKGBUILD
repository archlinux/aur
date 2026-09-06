# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20260630
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('x86_64')
url="https://github.com/petere/pguint"
license=('PostgreSQL')
depends=('glibc' 'postgresql')
makedepends=('clang' 'llvm' 'python')
source=("pguint-${pkgver}.tar.gz::https://github.com/petere/pguint/archive/$pkgver.tar.gz")
sha256sums=('fe13886b817723f90ad9bba9039c8454a04b53ce5a4678c05907957e21455dc6')

build() {
    cd "pguint-$pkgver"
    make
}

package() {
    cd "pguint-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
