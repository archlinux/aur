# Maintainer: d-air1 <youremail@domain.com>
# Contributor: silentnoodle <youremail@domain.com>
pkgname=bindtointerface
pkgver=1.0
pkgrel=1
arch=("x86_64")
pkgdesc="With this program you can bind applications to a specific network interface / network adapter."
url="https://github.com/JsBergbau/BindToInterface"
license=('GPL')
source=("https://raw.githubusercontent.com/JsBergbau/BindToInterface/d477326d85f64fdd1dc46382fe698e46f4843100/bindToInterface.c")
sha256sums=('9060792b340e9a9036796cfd0818a33a672c686ade24a681a8ce458f2c6c39a4')

build() {
	gcc \
	-nostartfiles \
	-fpic \
	-shared bindToInterface.c \
	-o bindToInterface.so \
	-ldl \
	-D_GNU_SOURCE
}

package() {
	install -Dm755 "./bindToInterface.so" "$pkgdir/usr/lib/bindToInterface.so"
	ln -s "bindToInterface.so" "$pkgdir/usr/lib/bindtointerface.so"
}

