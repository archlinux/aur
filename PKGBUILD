# Maintainer: Charles Dong <charlesdong_2000@outlook.com>
pkgname=xz-5.4
pkgver=5.4.6
pkgrel=1
pkgdesc="xz 5.4.x as a workaround for the recently known vulnerability"
arch=("x86_64")
url="https://sourceforge.net/projects/lzmautils/"
license=('GPL-2.0-or-later')
depends=("sh")
makedepends=("cmake" "make" "tar" "gzip")
checkdepends=("cmake")
optdepends=()
provides=("xz" "liblzma.so=5-64")
conflicts=("xz")
replaces=()
backup=()
options=()
install=
changelog=

_pkgname=xz

source=("$_pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/lzmautils/files/xz-$pkgver.tar.gz/download")
sha256sums=("aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c")

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname-$pkgver"
	make -k check
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
