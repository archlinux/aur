# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=libdial
pkgver=2.6
pkgrel=1
pkgdesc="library needed by tzclock"
arch=('x86_64')
url="https://theknight.co.uk/"
license=("GPL-3.0-only")
depends=('gtk3')
provides=("$pkgname.so=2-64")
source=("$pkgname-$pkgver.tar.bz2::$url/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('4639779bdf735dfda0755f22ddb7519ba8417813232e583a49f7a8fa01364d60')

build() {
    cd "$pkgname-$pkgver/"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver/"
    make DESTDIR="${pkgdir}" install
}
