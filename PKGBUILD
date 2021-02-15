# Maintainer: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Joe Hillenbrand <joehillen@gmail.com>

pkgname=guile-gcrypt
pkgver=0.3.0
pkgrel=1
pkgdesc='Guile bindings for libgcrypt'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/cwebber/guile-gcrypt"
license=('GPL3')
depends=('guile' 'libgcrypt')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/cwebber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('07394c3de4f31a36ca2b670e1998c526de891d9436f12e94d8862ab081274d6a')

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
