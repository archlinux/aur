# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
pkgname=sdrpp-git
pkgver=0.2.5
pkgrel=2
epoch=
pkgdesc="The Bloat-free SDR Receiver"
arch=('any')
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=('GPL')
groups=()
depends=("fftw" "glfw" "glew" "libvolk" "soapysdr" "libiio" "libad9361" "portaudio" "rtl-sdr")
makedepends=("gcc" "make" "cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	git clone https://github.com/AlexandreRouma/SDRPlusPlus
}

build() {
	cd "SDRPlusPlus"
	mkdir build
	cd build
	cmake ..
	make -j$(nproc)
}

package() {
	cd "SDRPlusPlus/build"
	make DESTDIR="$pkgdir/" install
}
