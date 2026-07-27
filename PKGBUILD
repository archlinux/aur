# Maintainer: Micheal <micheal12111@proton.me>
pkgname=duhh
pkgver=0.1.0
pkgrel=1
pkgdesc="The RAM tool with personality - sassy quotes and beautiful stats for Arch"
arch=('x86_64')
url="https://github.com/duhcli/duh"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/duhcli/duh/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --target-dir=target
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
