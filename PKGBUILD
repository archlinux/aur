# Maintainer: Fabian Brosda <fabi3141@gmx.de>
# Maintainer: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.5.0
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://codeberg.org/guile-gcrypt/guile-gcrypt"
license=('GPL3')
depends=('guile' 'libgcrypt')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('79ea92185f5771ec90459cef2ee8a43ac04cf37ae571182c4c5ca37ac5626951')

build() {
	cd "${srcdir}/${pkgname}"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
