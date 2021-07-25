# Maintainer: Carey Metcalfe <carey@[first initial + last name].ca>

pkgname=audiowaveform
pkgver=1.5.0
pkgrel=1
pkgdesc="Generate waveform data and render waveform images from audio files"
arch=('i686' 'x86_64')
url="https://github.com/bbc/audiowaveform"
license=('GPL3')
depends=('libmad' 'libsndfile' 'libid3tag' 'gd' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbc/audiowaveform/archive/$pkgver.tar.gz")
sha1sums=('8793cfb3971947ecf6fd8dd822738d3f6723c157')

build() {
	cd "$pkgname-$pkgver"
	cmake -DENABLE_TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
