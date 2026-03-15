# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20250815
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('x86_64')
url="https://github.com/petere/pguint"
license=('PostgreSQL')
depends=('glibc' 'postgresql')
makedepends=('clang' 'llvm' 'python')
source=("pguint-${pkgver}.tar.gz::https://github.com/petere/pguint/archive/$pkgver.tar.gz")
sha256sums=('0926430e4e7adace4b947e8d6c332a76208835307326758a9e76d8edf41c8643')

build() {
    cd "pguint-$pkgver"
    make
}

package() {
    cd "pguint-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
