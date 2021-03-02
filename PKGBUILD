# Maintainer: 
pkgname=libcrafter-git
pkgver=1.0
pkgrel=11
pkgdesc="Libcrafter is a high level library for C++ designed to create and decode network packets"
arch=(x86_64)
url="https://github.com/TETRX/local-dns-dump"
license=('GPL')
depends=()
makedepends=('git' 'make' 'gcc>=10' 'autoconf')
source=("git+$url#branch=master")
md5sums=('SKIP')


build() {
	cd local-dns-dump
	git submodule init
	git submodule update
}

package() {
	cd "local-dns-dump"
	make DESTDIR="$pkgdir" libcrafter
}
