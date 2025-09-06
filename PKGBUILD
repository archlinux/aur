# Maintainer: Jan <jan@example.com>
pkgname=raur
pkgver=1.0.2
pkgrel=1
pkgdesc="AUR + Pacman helper written in Rust"
arch=('x86_64')
url="https://github.com/GS-Works/raur"
license=('MIT')
depends=('rust' 'git' 'pacman' 'make' 'sudo')
source=("https://github.com/GS-Works/raur/releases/download/1.0.0/raur-1.0.0-1.tar.xz")
sha256sums=('1ea0bcf475129841155fe2a19cd166082a115e7f63c2b7961a453a156ccca1e8')

build() {
    cd "$srcdir"   # Direkt ins entpackte Verzeichnis
    cargo build --release
}

package() {
    cd "$srcdir"
    install -Dm755 target/release/raur "$pkgdir/usr/bin/raur"
}
