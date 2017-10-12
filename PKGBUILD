# Maintainer: Roy Oursler <roy.j.oursler@intel.com>
pkgname=isa-l_crypto
pkgver=2.20.0
pkgrel=1
pkgdesc="A collection of optimized low-level functions targeting storage applications"
arch=(x86_64)
url="https://github.com/01org/$pkgname"
license=('BSD')
makedepends=('nasm')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('fe247d36d1d665f309e83e1aa0af9ca07041c998')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix="${pkgdir}/usr"
    make
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    make check
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
