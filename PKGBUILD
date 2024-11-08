# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=tr31-git
_pkgname=tr31
pkgver=0.6.2
pkgrel=1
pkgdesc="Key block library and tools for ANSI X9.143, ASC X9 TR-31 and ISO 20038"
arch=("x86_64")
url="https://github.com/openemv/tr31"
license=("LGPL-2.1")
depends=()
provides=("tr31-tool")
conflicts=("tr31-tool")
source=("git+$url")
sha256sums=("SKIP")

build() {
  	cd "$_pkgname"
	git submodule update --init --recursive
	cmake -B build
	cmake --build build
}

package() {
  	cd "$_pkgname"
	DESTDIR="${pkgdir}" cmake --install build
}
