# Maintainer: Andrés Rodríguez <andres.rodriguez __at__ lithersoft.com>

pkgname=('libsysconfcpus-git')
pkgver=0.5
pkgrel=2
pkgdesc="LD_PRELOAD library to fake number of available cores - patched git version"
arch=(x86_64)
url="https://github.com/obmarg/libsysconfcpus"
license=('GPL2')
makedepends=("git")
source=("git://github.com/obmarg/libsysconfcpus.git")
sha256sums=("SKIP")

build() {
	cd libsysconfcpus
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/libsysconfcpus
	make DESTDIR=$pkgdir install
}
