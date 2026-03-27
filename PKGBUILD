# Maintainer: David Mazieres https://www.scs.stanford.edu/~dm/addr/
pkgname=jai
pkgver=0.2
pkgrel=1
pkgdesc="Light-weight sandbox for AI agents"
arch=('x86_64' 'aarch64')
url="https://jai.scs.stanford.edu/"
license=('GPL')
source=(
    "https://github.com/stanford-scs/jai/releases/download/v$pkgver/jai-$pkgver.tar.gz"
)
noextract=()
b2sums=('975bdf0416b40a715b65e2f615d6b4a3cc4fecd9b0af3423958bde224205353428deffc434fc5f406587bb14895ab7ecbc197184c9430ded6fe00cc7e81214f2')
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
