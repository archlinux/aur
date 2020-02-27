# Maintainer: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.2.0
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/cwebber/guile-gcrypt"
license=('GPL3')
depends=('guile' 'libgcrypt')
source=("https://notabug.org/cwebber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('415b0e8abbb25a0ef811dfda238c600c7003973f0f51db640668a72094c1cfb9')

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
