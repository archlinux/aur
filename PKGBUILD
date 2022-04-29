# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=libxpid
pkgname=(libxpid)
pkgver=v1.0.4
pkgrel=1
pkgdesc="Linux process discovery library. Its like nmap -- for pids."
arch=(x86_64)
url="https://github.com/kris-nova/xpid"
license=(MIT)
makedepends=(make clang cmake)
checkdepends=()
optdepends=()
backup=()
options=()
source=("git+https://github.com/kris-nova/xpid.git")
sha256sums=('SKIP')

build() {
	cd xpid
	git checkout tags/$pkgver -b $pkgver
	cd libxpid
	./configure
	cd build
	make
}

package() {
	cd xpid
	cd libxpid/build
	sudo make install
}
