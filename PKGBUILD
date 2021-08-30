# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=editasroot
pkgver=1.0
pkgrel=1
pkgdesc="Edit a file that requires root access"
arch=('x86_64')
url="https://github.com/maandree/editasroot"
license=('custom:ISC')
depends=(asroot)
source=(editasroot-$pkgver.tar.gz::https://github.com/maandree/editasroot/archive/${pkgver}.tar.gz)
sha256sums=(6d1a2c1ab44dd0c545c64b61ddea3224023132c3dcf1f3e11c61e297b9bab86c)

build () {
	cd "${srcdir}/editasroot-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot
}

package() {
	cd "${srcdir}/editasroot-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/usr/lib/editasroot install
}
