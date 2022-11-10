# Maintainer: RaphGL <raphfl.dev@gmail.com>
pkgname=tuckr-git
pkgver=0.5.0
pkgrel=1
epoch=1
pkgdesc="A super powered replacement for GNU Stow"
arch=('any')
url="https://github.com/RaphGL/Tuckr"
license=('GPLv3')
groups=()
depends=()
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

check() {
    cd Tuckr
    cargo test
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd Tuckr
    cargo build --release
}

package() {
    cd Tuckr
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tuckr"
}
