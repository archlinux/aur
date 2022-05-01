# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=libxpid
pkgname=(libxpid)
pkgver=v1.0.6
pkgrel=1
pkgdesc="Linux Process Scanning. (C Library). Find eBPF programs, containers, hidden pids. Like nmap for pids in the kernel."
arch=(x86_64)
url="https://github.com/kris-nova/xpid"
license=(MIT)
makedepends=(make clang cmake)
checkdepends=()
optdepends=()
backup=()
options=()
source=("git+https://github.com/kris-nova/xpid.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd xpid
	cd libxpid
	./configure
	cd build
	make
}

package() {
	cd xpid
	cd libxpid/build
	make DESTDIR="$pkgdir" install
}
