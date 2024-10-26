# Maintainer: devcoons <io.devcoons.com>
pkgname=jlock-encryption
pkgver=0.0.2
pkgrel=1
pkgdesc="A file encryption tool using AES encryption"
arch=('x86_64')
url="https://github.com/devcoons/jlock-encryption"
license=('GPL')
depends=('openssl') 
source=("jlock-encryption-0.0.2.tar.gz::https://github.com/devcoons/jlock-encryption/archive/refs/tags/v0.0.2.tar.gz")
sha256sums=('90fb7764ed88cb33099bee4ee0a101b7453e6cb33c99c90adbb8f19e62958ee8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}