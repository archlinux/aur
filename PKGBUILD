# Maintainer: Dylan Turner dylantdmt@gmail.com
pkgname=tetris-cli-git
pkgver=22.411
pkgrel=4
epoch=
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git' 'cargo')
source=('git+https://github.com/blueOkiris/tetris-cli.git')
#pre_remove=$pkgname.install

md5sums=('SKIP')

build() {
	cd tetris-cli
	cargo build --release
}

package() {
	cd tetris-cli
	echo "Installing to $pkgdir/usr/bin."

	mkdir -p "$pkgdir/usr/bin"
	cp target/release/tetris-cli "$pkgdir/usr/bin"
}

