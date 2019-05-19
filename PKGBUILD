# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=pazi
pkgver=0.3.0
pkgrel=1
pkgdesc="An autojump 'zap to directory' helper"
url="https://github.com/euank/pazi"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/euank/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f7434d4e15fbf587576842a32bfa201c034f589ce2922b0aee802116f4e6df87d7edb4524f0e49f7fbabd3eab42503d15bed11d5eff8827e2d271dd392ff5f03')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
