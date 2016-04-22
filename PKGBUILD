# Maintainer: kevku <kevku@gmx.com>
pkgname=m4acut
pkgver=0.1.2
pkgrel=1
pkgdesc="Losslessly & gaplessly cut m4a (AAC in MP4) files."
arch=("x86_64" "i686")
url="https://github.com/nu774/m4acut"
license=("ZLIB" "BSD")
depends=("l-smash")
source=("https://github.com/nu774/m4acut/archive/v$pkgver.tar.gz")
sha256sums=("16e4637d278113afd99823c9b34cc62263a7b008c3cd9ef934fc09672de03439")

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -i
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
