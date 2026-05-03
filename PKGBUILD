# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=editasroot
pkgver=1.0.3
pkgrel=1
pkgdesc="Edit a file that requires root access"
arch=(x86_64 aarch64)
url="https://codeberg.org/maandree/editasroot"
license=('custom:ISC')
depends=(asroot)
source=(editasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(907b06bc088c13037096252d25ca53f18bf2515be7974be464b91435b8ed1b77)

build () {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot
}

package() {
	cd "${srcdir}/editasroot"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot install
}
