# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=editasroot
pkgver=1.0.1
pkgrel=1
pkgdesc="Edit a file that requires root access"
arch=('x86_64')
url="https://codeberg.org/maandree/editasroot"
license=('custom:ISC')
depends=(asroot)
source=(editasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(5743a5f6796ce47d79a949aa3ef231da9ad71e47a4c1e5220cdd7ebb09547604)

build () {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot
}

package() {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot install
}
