# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=firefox9
pkgver=9.0.1
pkgrel=1
epoch=
pkgdesc="the firefox 9.0.1 OLD browser, please don't download this package if you don't know what are you doing"
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://archive.mozilla.org/pub/firefox/releases/9.0.1/source/firefox-9.0.1.source.tar.bz2")
noextract=()
md5sums=(7cf2bd379792a9b232267c6a79680566)
validpgpkeys=()

prepare() {
	cd "mozilla-release"
	./configure --prefix=/usr
}

build() {
	cd "mozilla-release"
	make -j$(nproc)
}

check() {
	cd "mozilla-release"
	echo " "
}

package() {
	cd "mozilla-release"
	make DESTDIR="$pkgdir/" install -j$(nproc)
}
