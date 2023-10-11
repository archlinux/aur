# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='anastasis'
pkgver='0.4.0'
pkgrel=1
pkgdesc='Protocol and implementation to securely deposit core secrets and recover them if their original copies are lost'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${pkgname}"
license=('AGPL')
depends=('jansson' 'gnunet' 'libgcrypt' 'libsodium' 'postgresql' 'taler-exchange'
         'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c0c2df5c55690a7bbb29cb1aa8c3d5c89a243a14f5aa0072ff0aa5c6cbabfb4602f79353fe6cb200929d85aee65ecc48520ed1a98eaf82acec79236eb19b9ed4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

