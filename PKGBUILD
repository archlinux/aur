# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=StormLib
pkgname=${_pkgname,,}
pkgver=9.10
pkgrel=1
pkgdesc="A C/C++ API to read and write MPQ files with support for merged archives, patch MPQs and more."
arch=("i686" "x86_64")
url="http://www.zezula.net/en/mpq/stormlib.html"
license=("MIT")
depends=("bzip2" "zlib")
makedepends=("cmake")
source=("https://github.com/ladislav-zezula/$_pkgname/archive/v$pkgver.zip")
sha256sums=("f6781e83afb843a688b2d6c63526bfaa203112caf421aa27467f85eee9da9381")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
