# Maintainer: Floranaras 
pkgname=teehee-bday
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun CLI tool that displays ASCII art birthday message using C recursion"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Floranaras/teehee-bday"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Floranaras/teehee-bday/archive/v$pkgver.tar.gz")
sha256sums=('d49e2f21f9af1c4ec8af76a720589989616d7f342cb3b5a7d55e889407c7188c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    gcc -o teehee-bday birthday.c -O2 -Wall
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the binary
    install -Dm755 teehee-bday "$pkgdir/usr/bin/teehee-bday"
}
