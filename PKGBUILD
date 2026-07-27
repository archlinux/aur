# Maintainer: Micheal <micheal12111@proton.me>
pkgname=duhh
pkgver=0.1.0
pkgrel=2
pkgdesc="The RAM tool with personality - sassy quotes and beautiful stats for Arch"
arch=('x86_64')
url="https://github.com/duhcli/duhh"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust')

source=("duhh-$pkgver.tar.gz::https://github.com/duhcli/duhh/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/duhh-$pkgver"
    cargo build --release --target-dir=target
}

package() {
    cd "$srcdir/duhh-$pkgver"
    install -Dm755 target/release/duhh "$pkgdir/usr/bin/duhh"
}
