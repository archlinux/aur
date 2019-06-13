# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=cb
pkgver=0.1.0
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/yaa110/cb"
license=("MIT")

pkgdesc='Command line interface to manage clipboard'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7cd81941d8313d4c195c5104e16c2e61c4cef654cdacef7ffec112690f53c7e937708da8456755e4926ae38526648a4a097d96398e8be54f66834fafc09a20e1')
makedepends=('rust' 'python3')
depends=('gcc-libs' 'libxcb')
conflicts=('cb-git' 'cb-bin')
provides=('cb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/cli" "$pkgdir/usr/bin/cb"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
