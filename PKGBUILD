# Maintainer: Majenko <matt@majenko.co.uk>
pkgname=indexfs-git
pkgver=1.0
pkgrel=1
pkgdesc="IndexFS Virtual Filesystem"
arch=('any')
url=https://github.com/MajenkoProjects/indexfs
license=('BSD')
builddepends=('autoconf' 'automake')
depends=('fuse' 'curl')

source=("git+https://github.com/MajenkoProjects/indexfs.git")
cksums=(SKIP)

build() {
	cd "indexfs"
	autoreconf -fi
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "indexfs"
	make DESTDIR="$pkgdir/" install
}
