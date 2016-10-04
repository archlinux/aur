# Maintainer: BrainDamage
pkgname="libsixel"
pkgrel=1
stripped_ver="1.7.2"
pkgver="v$stripped_ver"
pkgdesc="libsixel provides and encoder/decoder implementation for DEC SIXEL graphics, and some converter programs"
arch=("i686" "x86_64")
url="https://saitoha.github.io/libsixel/"
license=("MIT")
depends=("libjpeg-turbo" "libpng" "python" "curl")
sha1sums=("e6f7a745f5c7675f8abaaae3a28b8780567de49a")
source=("https://github.com/saitoha/libsixel/archive/$pkgver.tar.gz")

build() {
	cd "libsixel-$stripped_ver"
	./configure --prefix=/usr --enable-python
}

package() {
	cd "libsixel-$stripped_ver"
	make DESTDIR="$pkgdir" install
}
