pkgname=0xffff
pkgver=0.8
pkgrel=2
pkgdesc="Open Free Fiasco Firmware Flasher"
arch=("x86_64" "i686")
url="https://talk.maemo.org/showthread.php?t=87996"
license=('GPLv3')
depends=("libusb0")
makedepends=("libusb0")
optdepends=()
source=("http://repository.maemo.org/extras-devel/pool/fremantle/free/source/0/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=("d600d554bf24d30d5ccfb97dcb55189a9181ef1db98586ae9b98a779188ce03e")

build() {
	cd "0xFFFF-$pkgver"
	make
}

package() {
	cd "0xFFFF-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
