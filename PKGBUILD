# Maintainer: Micheal <micheal12111@proton.me>
pkgname=dope
pkgver=0.1.0
pkgrel=1
pkgdesc="The RAM tool with personality - sassy quotes and beautiful stats for Arch"
arch=('x86_64')
url="https://github.com/duhcli/dope"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust')

source=("dope-$pkgver.tar.gz::https://github.com/duhcli/dope/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/dope-$pkgver"
    cargo build --release --target-dir=target
}

package() {
    cd "$srcdir/dope-$pkgver"
    install -Dm755 target/release/dope "$pkgdir/usr/bin/dope"
}
