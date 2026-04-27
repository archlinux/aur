# Maintainer: exerinity <me@exerinity.com>
pkgname=timein
pkgver=3
pkgrel=1
pkgdesc="A minimal tool for quickly getting the time and date in another city or timezone"
arch=('x86_64')
url="https://github.com/exerinity/timein"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/exerinity/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b335cf3e74765d61952f1300b3da926fd49b8fd71f8ecc5d9c7b8f791433f551')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -o timein execute.c find.c listofcities.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 timein "$pkgdir/usr/bin/timein"
}
