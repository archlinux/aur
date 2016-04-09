# Maintainer: Mohammed Yaseen Mowzer <yaseen@mowzer.co.za>

pkgname=spectrum2
pkgver=2.0.3
pkgrel=1
#epoch=
pkgdesc="Create C++ transports easily"
arch=(x86_64 x64)
url="http://spectrum.im"
license=('GPL')
groups=()
depends=(libmariadbclient swiften curl log4cxx gcc-libs-multilib libpurple popt libpqxx)
makedepends=(protobuf swiften libpqxx libpurple avahi boost cmake cppunit expat libcommuni libidn sqlite log4cxx libmariadbclient popt libevent dbus-glib curl)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/hanzz/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('694172dfbf62d7de19bbcc06ba11113d238c86e36d39297b2f80d4b277e03933')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr  -DSPECTRUM_VERSION=${pkgver}
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
