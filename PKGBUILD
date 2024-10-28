# Maintainer: sreus <sricharanandra7@gmail.com>
pkgname=rustybrain
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI Based Task Management App for Archlinux"
arch=('x86_64')
url="https://github.com/sricharanandra/rustybrain"
license=('Apache')  # Use the license of your project
depends=('rust' 'cargo')  # Dependencies needed to build/run your project
source=("$pkgname-$pkgver.tar.gz::https://github.com/sricharanandra/rustybrain/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace SKIP with the actual checksum if needed

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/rustybrain" "$pkgdir/usr/bin/rustybrain"
}
