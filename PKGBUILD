# Maintainer: Andrés Rodríguez <andres.rodriguez __at__ lithersoft.com>

pkgname=('quickfm-git')
pkgver=v0.3.1.r3.g61f5b74
pkgrel=1
pkgdesc="A file manager implemented via QtQuick."
arch=(x86_64)
url="https://github.com/canatan/quickfm"
license=('GPL2')
source=("git://github.com/canatan/quickfm.git")
sha256sums=("SKIP")

pkgver() {
	cd quickfm
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd quickfm
	qmake PREFIX=/usr
	make
}

package() {
	cd $srcdir/quickfm
	make DESTDIR="$pkgdir/" INSTALL_ROOT="$pkgdir" install
}
