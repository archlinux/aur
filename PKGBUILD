# Maintainer: Your Name <honighoenn@gmail.com>

pkgname=distrohoop
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI Tool written in Rust that determines your next Distro"
arch=('x86_64')
url="https://github.com/br0sinski/distrohoop"
license=('MIT')
depends=('cargo')
makedepends=('git' 'rust')
install=
changelog=
source=("git+https://github.com/br0sinski/distrohoop.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname/distrohoop" 
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname/distrohoop" # Navigate to the directory with Cargo.toml
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

