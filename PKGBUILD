# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=sigar-git
_pkgname=sigar
pkgver=1.6.4.r600.ga6c61edf
pkgrel=3
pkgdesc="System Information Gatherer And Reporter"
arch=('x86_64')
url="https://github.com/hyperic/sigar"
license=('apache')
depends=()
makedepends=('cmake')
source=("git+https://github.com/boundary/sigar.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^sigar-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"

	./autogen.sh
	./configure --prefix="$pkgdir/usr"
}

build() {
	cd "$srcdir/$_pkgname"
    make
}

package() {
	cd "$srcdir/$_pkgname"
	make install
}

