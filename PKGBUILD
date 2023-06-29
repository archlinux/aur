# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='anastasis'
pkgver='0.3.2'
pkgrel=1
pkgdesc='Protocol and implementation to securely deposit core secrets and recover them if their original copies are lost'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${pkgname}"
license=('AGPL')
depends=('jansson' 'gnunet' 'libgcrypt' 'libsodium' 'postgresql' 'taler-exchange'
         'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c51dd7eab8836d4b3e6dfaf18fab8f4e1faedfc85a0e86189ac9265660618c2ce0b050f91b514c44fae65ad6ba53dc1b75240deb416b0131bda78bd9852d5dc3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

