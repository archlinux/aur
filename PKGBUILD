# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=editasroot
pkgver=1.0.1
pkgrel=1
pkgdesc="Edit a file that requires root access"
arch=('x86_64')
url="https://github.com/maandree/editasroot"
license=('custom:ISC')
depends=(asroot)
source=(editasroot-$pkgver.tar.gz::https://github.com/maandree/editasroot/archive/${pkgver}.tar.gz)
sha256sums=(08cadfc7eafe81bea2bde97b78d5e026990a80edbf06d1e7dec595ebe14353f3)

build () {
	cd "${srcdir}/editasroot-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot
}

package() {
	cd "${srcdir}/editasroot-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot install
}
