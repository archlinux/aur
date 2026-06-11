# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

pkgname=vtlock
pkgver=1.0
pkgrel=1
pkgdesc="Kernel-level VT switch lock for standalone screen lockers"
arch=('x86_64')
url="https://hub.darcs.net/stef204/vtlock"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://hub.darcs.net/stef204/vtlock/raw/releases/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://hub.darcs.net/stef204/vtlock/raw/releases/$pkgname-$pkgver.tar.gz.asc")
install=vtlock.install
validpgpkeys=('E0844009CF213E78ECD348795A6792BF5ECC3AC6')
sha256sums=('SKIP' 'SKIP')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm 644 README.md "$pkgdir/usr/share/doc/vtlock/README.md"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vtlock/LICENSE"
}
