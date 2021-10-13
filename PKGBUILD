# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: Alexandre Rouma <whatsthetgeek@gmail.com>
pkgname=sdrpp
pkgver=1.0.3
pkgrel=1
pkgdesc="The Bloat-free SDR Receiver - Release Version"
arch=('any')
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=('GPL')
conflicts=('sdrpp-git')
depends=("fftw" "glfw" "glew" "libvolk" "rtaudio")
makedepends=("git" "gcc" "make" "cmake" "soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay")
optdepends=("soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay")
source=('https://github.com/AlexandreRouma/SDRPlusPlus/archive/refs/tags/1.0.3.tar.gz')
md5sums=('0fc1b8baf5386fef5601f2c996e35503')

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
