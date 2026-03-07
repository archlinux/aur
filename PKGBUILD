# Maintainer: 27Onion Nebell <zzy20080201@gmail.com>
pkgname=uxncli-git
pkgver=r38.06844ce
pkgrel=1
pkgdesc="A partial emulator for the Varvara Ordinator, written in ANSI C."
arch=("x86_64")
url="https://git.sr.ht/~rabbits/uxncli"
license=('MIT')
depends=("glibc")
makedepends=("git")
provides=("uxncli")
conflicts=("uxn-git")
replaces=()
backup=()
options=()
source=("git+https://git.sr.ht/~rabbits/uxncli")
noextract=()
sha256sums=("SKIP")
pkgver() {
    cd "$srcdir/uxncli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/uxncli"
	mkdir -p bin
	cc $DEBUG_CFLAGS $LDFLAGS src/uxncli.c -o bin/uxncli
}

package() {
	cd "$srcdir/uxncli"
	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/usr/share/licenses/uxncli-git"
	cp -r bin "$pkgdir/usr"
	cp LICENSE "$pkgdir/usr/share/licenses/uxncli-git"
}
