
# Maintainer: Zehka <aur@zehka.net>
pkgname=guglielmo
pkgver=v0.4
pkgrel=0
epoch=
pkgdesc="Qt based FM / Dab tuner"
arch=("any")
url="https://github.com/marcogrecopriolo/guglielmo"
license=('GPL2')
groups=()
depends=("qwt" "fftw" "libsndfile" "libsamplerate" "faad2" "portaudio" "qt5-multimedia")
makedepends=("make" "cmake" "git")
checkdepends=()
optdepends=(
   'rtl-sdr: Receive radio via RTL-SDR'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("guglielmo::git+https://github.com/marcogrecopriolo/guglielmo.git#tag=$pkgver")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	mkdir -p $pkgname/build
	cd "$pkgname/build" || exit 1
}

build() {
	cd "$pkgname/build" || exit 1
	cmake ..
	make
}

check() {
	return 0
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cp "$pkgname/build/guglielmo" "$pkgdir/usr/bin"
}
