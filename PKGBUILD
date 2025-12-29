# Maintainer: Camila "Mocha" Rose rblossom.dev at gmail dot com

pkgname=ChocoLang
pkgver=0.4.8
pkgrel=1
pkgdesc="ChocoLang - A sweet programming language."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/mochacinno-dev/ChocoLang"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mochacinno-dev/ChocoLang/archive/v$pkgver.tar.gz")
sha256sums=('8ff7f22233a303ea591a14d3ded44ca6bc34b0d2969c9999baab2c4e7a9cb6a0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Compile ChocoLang
    g++ -std=c++17 -O3 -o choco main.cpp
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 choco "$pkgdir/usr/bin/choco"
    
    # Install documentation (if you have any)
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license (if you have one)
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install man page (if you create one)
    # install -Dm644 choco.1 "$pkgdir/usr/share/man/man1/choco.1"
}

# vim:set ts=2 sw=2 et:
