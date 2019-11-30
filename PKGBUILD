# Maintainer Joan Figueras <ffigue@gmail.com>

pkgname=milcheck
pkgver=0.1.7
pkgrel=1
makedepends=('rust' 'cargo' 'git')
arch=('x86_64')
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal, written in Rust"
url="https://github.com/doums/milcheck"
license=('custom:Mozilla Public License v2.0')
source=("https://github.com/doums/milcheck/archive/v${pkgver}.tar.gz")
sha256sums=('67577d03c39c106ed3f080cf60a4d6a428ef71b55f6b0035f36be375a6fdc26d')

build() {
    cd $pkgname-$pkgver
    cargo build --release
}

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver/target/release/${pkgname} $pkgdir/usr/bin/${pkgname}
}
