# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=rvlprog
pkgver=0.91
pkgrel=1
pkgdesc="CLI tool for REVELPROG IS programmer"
arch=(x86_64)
url="https://gitlab.com/spectrum70/rvlprog"
license=('GPL3')
source=("https://gitlab.com/spectrum70/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('4f30a539c9337af9ee47478c16580497')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

# check() {
#   cd "$pkgname-$pkgver"
#   make -k check
# }

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
