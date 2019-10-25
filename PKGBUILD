# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=baka
pkgver=0.0.0.15.986fba1
pkgrel=2
pkgdesc="GTK+3 GUI for the pacman package manager"
arch=('x86_64')
url="https://github.com/allanbrokeit/baka"
license=('GPL2')
depends=('pacman' 'gtk3')
source=("git+https://github.com/allanbrokeit/baka.git?commit=986fba151079362bfbb8e6138acc0f8b9aaca6b5")
md5sums=("SKIP")

prepare() {
	cd baka
	autoreconf -i
}

build() {
	cd baka
	./configure --prefix=/usr
	make
}

package() {
	cd baka
	make DESTDIR="$pkgdir/" install
}
