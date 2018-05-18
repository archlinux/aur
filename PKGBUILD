pkgname="xpilot-atoms-git"
pkgver=v0.0.1.r0.g2097a61
pkgrel=2
pkgdesc="A multi-player 2D spacewar game"
arch=('x86_64')
url="https://github.com/atoms118/xpilot-atoms-git"
license=('GPL2')
depends=('sdl_ttf' 'sdl_image' 'glu' 'libxxf86misc')
optdepends=('openal' 'freealut' 'python')
makedepends=('gcc' 'make' 'sh' 'git')
source=("git+git://github.com/atoms118/xpilot-atoms.git")
sha256sums=('SKIP')

pkgver() {
	cd xpilot-atoms
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd xpilot-atoms
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd xpilot-atoms
	mkdir -p $pkgdir/usr
	make install
}
