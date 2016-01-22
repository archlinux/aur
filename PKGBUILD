# Maintainer: Mohammed Yaseen Mowzer <yaseen@mowzer.co.za>
pkgname=spectrum2
pkgver=2.0.0
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
sha256sums=('bd1b79fbc0cb300d9ce1f7d79503f96820dbac60f247e2973225ff9f7f1ff07f')
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
