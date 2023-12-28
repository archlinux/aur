# Maintainer: Patrik McMullin <patrikmcm@outlook.com>
_pkgname=femto
pkgname="$_pkgname-git"
pkgver="0.1.0"
pkgrel=1
pkgdesc="A terminal-based text editor written in 300 lines of Rust"
arch=("any")
url="https://github.com/frapa/femto"
license=("MIT")
depends=()
makedepends=("git" "cargo")
optdepends=()
provides=()
conflicts=()
source=("$_pkgname::git+https://github.com/frapa/femto.git")
md5sums=()

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml | cut -d " " -f 3)"
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
