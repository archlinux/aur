# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=ypsilon-scheme
pkgver=0.9.6.update3
pkgrel=2
epoch=
pkgdesc="The implementation of R6RS Scheme Programming Language for real-time applications."
arch=(x86_64 i686)
url=""
license=('unknown')
groups=()
depends=()
makedepends=(cpio)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ypsilon/ypsilon-$pkgver.tar.gz")
md5sums=('b330ebabce9b665418f3c347a43dcd24')
noextract=()
validpgpkeys=()

build() {
	cd "ypsilon-$pkgver"
	sed -i 's|/usr/local|/usr|' Makefile
	sed -i 's|/usr/local/share/ypsilon|/usr/share/ypsilon|' src/core.h
	make PREFIX=/usr
}

package() {
	cd "ypsilon-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}

