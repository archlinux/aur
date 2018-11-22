# Maintainer: Carey Metcalfe <carey@[first initial + last name].ca>

pkgname=audiowaveform
pkgver=1.3.0
pkgrel=1
pkgdesc="Generate waveform data and render waveform images from audio files"
arch=('i686' 'x86_64')
url="https://github.com/bbc/audiowaveform"
license=('GPL3')
depends=('libmad' 'libsndfile' 'libid3tag' 'gd' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/bbc/audiowaveform/archive/$pkgver.tar.gz")
sha1sums=('d09830c2bff4d6cb9a36c8a470e703ff9f7c5c2d')

build() {
	cd "$pkgname-$pkgver"
	cmake -DENABLE_TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
