# Maintainer: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.4.0
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/cwebber/guile-gcrypt"
license=('GPL3')
depends=('guile' 'libgcrypt')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/cwebber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('35f0681e01defab0aaa2a83227c0be836b0a1303dd1f7279497a76dd1255b17e')

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
