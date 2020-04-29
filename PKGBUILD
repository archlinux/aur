# Maintainer: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.2.1
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/cwebber/guile-gcrypt"
license=('GPL3')
depends=('guile' 'libgcrypt')
source=("https://notabug.org/cwebber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8de1bbf5e952e15cd6b03e26701fbfa0c2266d975212543a41c9aa3a01f741e2')

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
