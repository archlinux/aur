# Maintainer: BrainDamage
pkgname="libsixel"
pkgrel=1
stripped_ver="1.7.3"
pkgver="v$stripped_ver"
pkgdesc="libsixel provides and encoder/decoder implementation for DEC SIXEL graphics, and some converter programs"
arch=("i686" "x86_64")
url="https://saitoha.github.io/libsixel/"
license=("MIT")
depends=("libjpeg-turbo" "libpng" "python" "curl")
sha256sums=('5a6e369b839e406a85cb54f2700e48d211a78618d7d4b6e3cd81d97dfda9ade9')
source=("https://github.com/saitoha/libsixel/archive/$pkgver.tar.gz")

build() {
	cd "libsixel-$stripped_ver"
	./configure --prefix=/usr --enable-python
}

package() {
	cd "libsixel-$stripped_ver"
	make DESTDIR="$pkgdir" install
}
