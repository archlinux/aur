# Maintainer: Dylan Turner dylantdmt@gmail.com
pkgname=tetris-cli-git
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git')
source=('git://github.com/blueOkiris/tetris-cli.git')
#pre_remove=$pkgname.install

md5sums=('SKIP')

build() {
	cd tetris-cli
	make tetris-cli
}

package() {
	cd tetris-cli
	echo "Installing to $pkgdir/usr/bin."

	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/usr/bin" install
}

