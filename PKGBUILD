# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: Alexandre Rouma <whatsthetgeek@gmail.com>
pkgname=sdrpp
pkgver=1.0.4
pkgrel=1
pkgdesc="The Bloat-free SDR Receiver - Release Version"
arch=('any')
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=('GPL')
conflicts=('sdrpp-git')
depends=("fftw" "glfw" "glew" "libvolk" "rtaudio")
makedepends=("git" "gcc" "make" "cmake" "soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay")
optdepends=("soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay")
source=("https://github.com/AlexandreRouma/SDRPlusPlus/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('dbebd79f56efa5fd4620db19f8135366')

build() {
	cd "SDRPlusPlus-${pkgver}"
	mkdir build
	cd build
	cmake .. -DOPT_BUILD_SDRPLAY_SOURCE=ON
	make $MAKEOPTS
}

package() {
	cd "SDRPlusPlus-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
}
