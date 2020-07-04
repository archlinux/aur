# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=rog-core
pkgbase=rog-core
pkgver=0.14.1
pkgrel=1
epoch=
pkgdesc="A utility for Linux to control many aspects (eventually) of the ASUS ROG laptops like the Zephyrus GX502GW"
arch=('x86_64')
url="https://github.com/flukejones/rog-core"
license=('MPL2')
groups=()
depends=(dbus libusb)
makedepends=(rust clang)
checkdepends=()
optdepends=()
conflicts=()
backup=()
options=()
install=
changelog=

source=("https://github.com/flukejones/rog-core/archive/v$pkgver.tar.gz")
sha256sums=('86eb387b9522b2d2e1751f0520da327655c73cdef6b109890add3ad47f18c1f4')
noextract=()
validpgpkeys=()

build() {
	echo $srcdir
	cd "$srcdir"/$pkgname-$pkgver
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	DESTDIR="$pkgdir"/ make install
}

