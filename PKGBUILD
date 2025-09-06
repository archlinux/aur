# Maintainer: Jan <jan@example.com>
pkgname=raur
pkgver=1.0.1
pkgrel=1
pkgdesc="AUR + Pacman helper written in Rust"
arch=('x86_64')
url="https://github.com/GS-Works/raur"
license=('MIT')
depends=('rust' 'git' 'pacman' 'make' 'sudo')
source=("https://github.com/GS-Works/raur/releases/download/1.0.0/raur-1.0.0-1.tar.xz")
sha256sums=('3265ea31339e13d5ed42f2928e1a036e8c0887788d2e1f46223ba0515875f1bd')

build() {
    cd "$srcdir"   # Direkt ins entpackte Verzeichnis
    cargo build --release
}

package() {
    cd "$srcdir"
    install -Dm755 target/release/raur "$pkgdir/usr/bin/raur"
}
