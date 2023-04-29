# Maintainer: Felice D'Angelo <felice.dangelo2013@gmail.com>
pkgname=clue
pkgver=3.2.0
pkgrel=1
pkgdesc="Clue is a programming language that compiles blazingly fast into Lua code with a syntax similar to languages like C or Rust."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'arm')
url="https://github.com/ClueLang/Clue"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
checkdepends=()
optdepends=()
source=("git+https://github.com/ClueLang/Clue.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')

build() {
    cd "$srcdir/Clue"
    cargo build --release
}

package() {
    cd "$srcdir/Clue"
    install -Dm755 target/release/clue "$pkgdir/usr/bin/clue"
}
