# Maintainer: GN Vageesh <vageeshgn2005@gmail.com>
pkgname=bigen
pkgver=r2.544cb74
pkgrel=1
pkgdesc="A Password Generator And Controller"
arch=('x86_64')
url="https://github.com/GNVageesh/bigen"
license=('MIT')
depends=('glibc' 'gcc-libs' 'cmake')
makedepends=('git')
source=("bigen::git://github.com/GNVageesh/bigen")
md5sums=('SKIP')

pkgver() {
 	cd "$pkgname"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	mkdir build
	cd build
	cmake ..
	sudo make install
}

package() {
	cd "$pkgname"
	install -Dm755 ./bigen "$pkgdir/usr/bin/bigen"
	install -Dm644 ./README.md "$pkgdir/usr/shar/doc/$pkgname"
}
