# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss
pkgver=1.6.0
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD')
depends=('efivar' 'openssl')
source=("https://sourceforge.net/projects/ibmtpm20tss/files/ibmtss$pkgver.tar.gz")
sha256sums=('83bebb0d36ef9ced6cf3be2be9f0b4463a692d67254df31216271a916aaba851')

build() {
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
