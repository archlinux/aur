# Maintainer: Patrick Kimmig <pkimsec@proton.me>
pkgname=p-md5-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple MD5 hash generator in C"
arch=('x86_64')
url="https://github.com/pkimSec/p-md5"
license=('GPL3.0')
depends=()
makedepends=('gcc')
options=('!debug')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c0249e02d9caccb3b52462031f87171f16c8005153f277762ffd7ae413d1646')

build() {
    cd "$srcdir/p-md5-$pkgver"
    gcc -O2 -s -o p-md5-git md5-hasher.c
    rm -f *.o *.a
}

package() {
    cd "$srcdir/p-md5-$pkgver"
    install -Dm755 p-md5-git "$pkgdir/usr/bin/p-md5-git"
}
