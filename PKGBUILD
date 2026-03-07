# Maintainer: 27Onion Nebell <zzy20080201@gmail.com>
pkgname=uxn2-git
pkgver=r0.0a736c2
pkgrel=1
pkgdesc="A graphical emulator for the Varvara Computer, written in C99(SDL2)."
arch=("x86_64")
url="https://git.sr.ht/~rabbits/uxn2"
license=('MIT')
depends=("sdl2-compat")
makedepends=("git")
provides=("uxn2")
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://git.sr.ht/~rabbits/uxn2")
noextract=()
sha256sums=("SKIP")
pkgver() {
    cd "$srcdir/uxn2"
	echo "r0.$(git rev-parse --short HEAD)"
    # git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/uxn2"
	mkdir -p usr/share/man/man7
	make PREFIX=usr install
}

package() {
	cd "$srcdir/uxn2"
	mkdir -p usr/share/licenses/uxn2-git
	cp ./LICENSE usr/share/licenses/uxn2-git
	cp -r usr "$pkgdir/"
	rm -rf usr
}
