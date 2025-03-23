
# Maintainer: techapplez <twinebtech@proton.me>

pkgname="tarah"
pkgver=0.0.1
pkgrel=1
pkgdesc="An extremely fast and simple AUR helper written in Rust."
license=('GPL')
depends=('pacman')
makedepends=('rustup')
source=("https://github.com/techapplez/tarah/releases/download/stable/tarah-v0.0.1_alpha.tar.xz")
sha256sums=('SKIP')
arch=('x86_64')
autoextract=()
options=('!buildflags' '!makeflags' '!lto')


build() {
	export LDFLAGS+=" -lssh2" 
	cargo build --release --locked --all-features	
	cargo build
}

package() {
	sudo cp target/release/tarah /usr/bin
}
