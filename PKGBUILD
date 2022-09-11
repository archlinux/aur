# Maintainer: DumbMahreeo < dumbmahreeo (at) duck (dot) com >
# (This email address can only receive emails, not reply to them)
pkgname=commando
pkgver=0.6.0
pkgrel=6
pkgdesc='A fast, locate-like utility to search for commands in Arch Linux repos'
arch=('i686' 'x86_64')
url='https://github.com/DumbMahreeo/commando'
license=('MIT')
depends=('libarchive' 'cargo')
source=("https://github.com/DumbMahreeo/commando/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ba0a39ccdc795b4df4768157d75d0d3e56c8b33cb335ee90636027fdfe82df0b')
install='commando.install'

build() {
	cd "$srcdir/commando-$pkgver/"
	cargo build --release --locked
}

package() {
	cd "$srcdir/commando-$pkgver/"
	install -Dm755 'target/release/commando' -t "$pkgdir/usr/bin"
}
