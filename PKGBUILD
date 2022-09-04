# Maintainer: DumbMahreeo < dumbmahreeo (at) duck (dot) com >
pkgname=commando
pkgver=0.5.1
pkgrel=1
pkgdesc="A fast, locate-like utility to search for commands in Arch Linux repos"
arch=('i686' 'x86_64')
url="https://github.com/DumbMahreeo/commando"
license=('MIT')
depends=('gcc-libs' 'rust-src' 'libarchive')
provides=('commando')
source=("https://github.com/DumbMahreeo/commando/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4357005f3217e9cf3035708e527e176b83c357000a60087cf628419dfb82f0ab")

build() {
	cd "$srcdir/commando-$pkgver/"
	cargo build --release --locked
}

package() {
	cd "$srcdir/commando-$pkgver/"
	install -Dm755 "target/release/commando" -t "$pkgdir/usr/bin"
}
