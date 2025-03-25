# Maintainer: DrCoomer <isfortner@gmail.com>
pkgname=blahaj-rs-git
pkgver=1
pkgrel=1
epoch=
pkgdesc="Gay sharks at your local terminal - but in rust! lolcat-like CLI tool "
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/yoshisaac/BLAHAJ-rs"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=('blahaj')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yoshisaac/BLAHAJ-rs/archive/refs/tags/AUR-Release.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "BLAHAJ-rs-AUR-Release"
}

build() {
    cd "BLAHAJ-rs-AUR-Release"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "BLAHAJ-rs-AUR-Release"
    mv "target/release/blahaj-rs" "target/release/blahaj"
    install -Dm755 "target/release/blahaj" -t "$pkgdir/usr/bin/"
}
