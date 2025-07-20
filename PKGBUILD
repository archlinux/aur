# Maintainer: Floranaras <email@example.com>
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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    gcc -o teehee-bday birthday.c -O2 -Wall
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the binary
    install -Dm755 teehee-bday "$pkgdir/usr/bin/teehee-bday"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
