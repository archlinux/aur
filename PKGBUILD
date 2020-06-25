# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=rog-core
pkgbase=rog-core
pkgver=1.11.1
pkgrel=2
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
sha256sums=('4719818e26db6d65ce3eb684485e9cd146cc84d81283723fe8b4472518bdd835')
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

