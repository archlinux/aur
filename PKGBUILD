# Maintainer: Jan <jan@example.com>
pkgname=raur
pkgver=1.0.0
pkgrel=1
pkgdesc="AUR + Pacman helper written in Rust"
arch=('x86_64')
url="https://github.com/GS-Works/raur"
license=('MIT')
depends=('rust' 'git' 'pacman' 'make' 'sudo')
source=("https://github.com/GS-Works/raur/releases/download/1.0.0/raur-1.0.0-1.tar.xz")
sha256sums=('cba2b9d57da03ecda2a9acee6b61f15a6df30564c777e7f18ce7f106884b7c9d')

build() {
    cd "$srcdir"   # Direkt ins entpackte Verzeichnis
    cargo build --release
}

package() {
    cd "$srcdir"
    install -Dm755 target/release/raur "$pkgdir/usr/bin/raur"
}
