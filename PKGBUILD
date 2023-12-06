# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr-luarvique
pkgver=0.18.16
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio."
arch=('i686' 'x86_64')
url="https://github.com/luarvique/csdr"
license=('GPL3')
depends=('gcc-libs' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
conflicts=('csdr')
provides=('csdr')
source=("$pkgname"::"git+https://github.com/luarvique/csdr.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
