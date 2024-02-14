# Maintainer: Carey Metcalfe <carey@[first initial + last name].ca>

pkgname=audiowaveform
pkgver=1.10.1
pkgrel=1
pkgdesc="Generate waveform data and render waveform images from audio files"
arch=('i686' 'x86_64')
url="https://github.com/bbc/audiowaveform"
license=('GPL-3.0-only')
depends=('libmad' 'libsndfile' 'libid3tag' 'gd' 'boost-libs' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbc/audiowaveform/archive/$pkgver.tar.gz")
sha256sums=('bd283d84dc84fda84f4090fddde9a5bef924c588dd7bf6acaa8f7b946efb42a4')

build() {
	cd "$pkgname-$pkgver"
	cmake -DENABLE_TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
