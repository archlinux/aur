pkgname=gemini-cli
pkgver=1.0.3
pkgrel=3
pkgdesc="Terminal-based tool for interacting with Gemini"
maintainer="Marcos Roque <devmarcosdanielr@gmail.com>"
url="https://github.com/marcosdanielr/gemini-cli"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'rust')
source=("git+https://github.com/marcosdanielr/gemini-cli.git")
install="gemini-cli.install"

build() {
    cd "$srcdir/gemini-cli"
    cargo build --release
}

package() {
    cd "$srcdir/gemini-cli"
    install -Dm755 target/release/gemini-cli "$pkgdir/usr/bin/gemini-cli"
}
