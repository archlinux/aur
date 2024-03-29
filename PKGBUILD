# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='anastasis'
pkgver='0.4.1'
pkgrel=1
pkgdesc='Protocol and implementation to securely deposit core secrets and recover them if their original copies are lost'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${pkgname}"
license=('AGPL')
depends=('jansson' 'gnunet' 'libgcrypt' 'libsodium' 'postgresql' 'taler-exchange'
         'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7e7630e59bdac91f7abb89808bfade642a4802cd464108c69f39e329b7597f6d3c1cbf81f99bd179cab8bff2951ededf1f1421e47606ef27d86ca281517addd6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

