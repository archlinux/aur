# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=dinotrace
pkgver="9.4d"
pkgrel=1
pkgdesc="X11 waveform viewer with support for VCD, ASCII and other trace formats."
arch=("x86_64" "i686")
url="http://www.veripool.org/projects/dinotrace/"
license=('GPL3')
depends=("xorg-server" "lesstif")
makedepends=()
source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('6965bd6cdbf246a133933f917b628b13')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
