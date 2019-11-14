# Maintainer: BrainDamage
pkgname="libsixel"
pkgrel=2
stripped_ver="1.8.2"
pkgver="v$stripped_ver"
pkgdesc="libsixel provides and encoder/decoder implementation for DEC SIXEL graphics, and some converter programs"
arch=("i686" "x86_64")
url="https://saitoha.github.io/libsixel/"
license=("MIT")
depends=("libjpeg-turbo" "libpng" "python" "curl")
sha256sums=('c464d2a6fcf35e9e6bad1876729e853a8b9f6abfe97d9e3487c9bfac45cf2a5f')
source=("https://github.com/saitoha/libsixel/archive/$pkgver.tar.gz")

build() {
	cd "libsixel-$stripped_ver"
	./configure --prefix=/usr --enable-python
}

package() {
	cd "libsixel-$stripped_ver"
	make DESTDIR="$pkgdir" install
}
