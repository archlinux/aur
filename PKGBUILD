# Maintainer: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.1.0
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/cwebber/guile-gcrypt"
license=('LGPL3')
depends=('guile' 'libgcrypt')
source=("https://notabug.org/cwebber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('63969929bb100ef29f4d050384aba565cd75e6e746168aa9dcab2e3b5d3c39be')

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -fi
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
