# Maintainer: devcoons <io.devcoons.com>
pkgname=jlock-encryption
pkgver=0.0.1
pkgrel=1
pkgdesc="A file encryption tool using AES encryption"
arch=('x86_64')
url="https://github.com/devcoons/jlock-encryption"
license=('GPL')
depends=('openssl') 
source=("jlock-encryption-0.0.1.tar.gz::https://github.com/devcoons/jlock-encryption/archive/refs/tags/v0.0.1.tar.gz")
sha256sums=('413815df70a8defd92bf224777b4e2ef090ee0026387726f726ce1bf21c792b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}