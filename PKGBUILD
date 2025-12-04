# Alfred Roos alfred@stensatter.se
pkgname=imagine-term-git
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="Imagine is a program that displays images and video in the terminal."
arch=(x86_64)
url="https://github.com/spynets/imagine"
license=('GPL-3.0-or-later')
depends=(ffmpeg)
makedepends=(git gcc)
conflicts=(imagine)
md5sums=()

prepare() {
		git clone https://github.com/spynets/imagine
		cd imagine
		git submodule update --init --recursive
}

build() {
	cd imagine
	make
}

package() {
	cd imagine
	install -Dm755 ./bin/imagine "$pkgdir/usr/bin/imagine"
	install -Dm655 ./readme.md "$pkgdir/usr/share/doc/imagine-term-images/README"
	install -Dm655 ./LICENSE "$pkgdir/usr/share/licenses/imagine-term-images/LICENSE"
}
