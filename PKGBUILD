# Maintainer: Your Name <youremail@domain.com>
pkgname=0xffff
pkgver=0.6.1
pkgrel=1
pkgdesc="Open Free Fiasco Firmware Flasher "
arch=("x86_64" "i686")
url="https://talk.maemo.org/showthread.php?t=87996"
license=('GPLv3')
depends=("libusb-compat")
makedepends=("libusb-compat")
optdepends=()
source=("http://repository.maemo.org/extras-devel/pool/fremantle/free/source/0/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha1sums=("898d5c05c0835c340b63ff3e8e2c458d29b93bd8")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
