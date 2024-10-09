# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=editasroot
pkgver=1.0.2
pkgrel=1
pkgdesc="Edit a file that requires root access"
arch=('x86_64')
url="https://codeberg.org/maandree/editasroot"
license=('custom:ISC')
depends=(asroot)
source=(editasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(669513b4b86bf0a7a22d58c1f3acd2251fabde0c9897b1d95cf01da43c4a3052)

build () {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot
}

package() {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot install
}
