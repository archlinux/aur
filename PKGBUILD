# Maintainer: Your Name <youremail@domain.com>
pkgname=bindtointerface
pkgver=4b03914
pkgrel=2
arch=("x86_64")
pkgdesc="With this program you can bind applications to a specific network interface / network adapter."
url="https://github.com/JsBergbau/BindToInterface"
license=('GPL')
source=("https://raw.githubusercontent.com/JsBergbau/BindToInterface/4b039146016d8fbd3bc3e8e5df16eb10ba03c397/bindToInterface.c")
sha256sums=('04a74f52923a0d92102802162451efb5bddf9251c9843ef49e3f4decbaf9e819')

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

