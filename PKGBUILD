# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=xpid
pkgname=(xpid)
pkgver=v1.0.6
pkgrel=1
pkgdesc="Linux Process Scanning. (CLI Runtime). Find eBPF programs, containers, hidden pids. Like nmap for pids in the kernel."
arch=(x86_64)
url="https://github.com/kris-nova/xpid"
license=(MIT)
makedepends=(libxpid go make)
checkdepends=()
optdepends=()
backup=()
options=()
source=("git+https://github.com/kris-nova/xpid.git")
sha256sums=('SKIP')

build() {
	cd $pkgname
	git checkout tags/$pkgver -b $pkgver
	GO111MODULE=on
	go mod vendor
	go mod download
	make
}

package() {
	cd $pkgname
	make install
}
