# Maintainer: Marcantonio Soda Jr <m@soda.fm>
pkgname=tuib
pkgver=0.0.1
pkgrel=1
pkgdesc="TUI Brightness Controller"
arch=(x86_64 i686)
url="https://github.com/marcSoda/tuib"
license=('MIT')
groups=()
depends=()
makedepends=(cargo)
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
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
