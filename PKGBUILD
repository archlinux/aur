# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss
pkgver=2.0.1
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD')
depends=('efivar' 'openssl')
source=("https://sourceforge.net/projects/ibmtpm20tss/files/ibmtss$pkgver.tar.gz")
sha256sums=('c4f29ab25eed57796a275b7cc0882d0340736232af34081f13fd89b3e7183d9b')

build() {
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
