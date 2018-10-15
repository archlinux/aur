pkgname=0xffff
pkgver=0.8
pkgrel=1
pkgdesc="Open Free Fiasco Firmware Flasher"
arch=("x86_64" "i686")
url="https://talk.maemo.org/showthread.php?t=87996"
license=('GPLv3')
depends=("libusb0")
makedepends=("libusb0")
optdepends=()
source=("http://repository.maemo.org/extras-devel/pool/fremantle/free/source/0/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=("5ab8197989586703fc501741766343df8fa26ca4b8603ad3c2e922f3be10fd87")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
