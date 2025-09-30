# Maintainer: RaphGL <raphfl.dev@gmail.com>
pkgname=tuckr-git
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="A super powered replacement for GNU Stow"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/RaphGL/Tuckr"
license=('GPLv3')
makedepends=('cargo' 'git')
source=("git+$url")
md5sums=("SKIP")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd Tuckr
    git checkout $pkgver
    cargo build --release
}

package() {
    cd Tuckr
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tuckr"
}
