# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=tpmtool
pkgver=3.7.4
pkgrel=1
pkgdesc='Program that allows handling cryptographic data from the TPM chip'
arch=('x86_64')
url='https://www.gnutls.org/'
license=('GPL3' 'LGPL2.1')
depends=('gnutls' 'trousers')
source=("https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-${pkgver}.tar.xz")
sha256sums=('e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f')

build() {
	cd "gnutls-$pkgver"
	./configure --enable-static --disable-shared \
		--disable-cxx \
		--disable-doc \
		--disable-guile \
		--disable-libdane
	make
}

package() {
	cd "gnutls-$pkgver"
	install -D src/tpmtool "$pkgdir/usr/bin/tpmtool"
}
