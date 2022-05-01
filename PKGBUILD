# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=xpid
pkgname=(xpid)
pkgver=v1.1.1
pkgrel=1
pkgdesc="Linux Process Scanning. (CLI Runtime). Find eBPF programs, containers, hidden pids. Like nmap for pids in the kernel."
arch=(x86_64)
url="https://github.com/kris-nova/xpid"
license=(MIT)
makedepends=(libxpid go make)
checkdepends=(libxpid)
optdepends=()
backup=()
options=()
source=("git+https://github.com/kris-nova/xpid.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd $pkgname
	GO111MODULE=on
	go mod vendor
	go mod download
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
