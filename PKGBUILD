# Maintainer: David Mazieres https://www.scs.stanford.edu/~dm/addr/
pkgname=jai
pkgver=0.3
pkgrel=1
pkgdesc="Light-weight sandbox for AI agents"
arch=('x86_64' 'aarch64')
url="https://jai.scs.stanford.edu/"
license=('GPL')
source=(
    "https://github.com/stanford-scs/jai/releases/download/v$pkgver/jai-$pkgver.tar.gz"
)
noextract=()
b2sums=('57a34be7a0404cc81cfb12305f0550525c4f8d161c6b3592c563755922f2e2aea361cd892edd04bae70c5c5551a76d3625d54793afe847d4e287a2755b2026da')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
