# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=baka
pkgver=0.0.0.15.986fba1
pkgrel=1
pkgdesc="GTK+3 GUI for the pacman package manager"
arch=('x86_64')
url="https://github.com/allanbrokeit/baka"
license=('GPL2')
depends=('pacman' 'gtk3')
source=("git+https://github.com/allanbrokeit/baka.git")
md5sums=("SKIP")

pkgver() {
  cd baka
  printf "0.0.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd baka
	autoreconf -i
}

build() {
	cd baka
	./configure
	make
}

package() {
	cd baka
	make DESTDIR="$pkgdir/" install
}
