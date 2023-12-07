# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss
pkgver=2.1.1
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD')
depends=('efivar' 'openssl')
source=("https://sourceforge.net/projects/ibmtpm20tss/files/ibmtss$pkgver.tar.gz")
sha256sums=('02d5e8686eb6742803e1521681ff377ca08ebec5a956f800fbc4fb13bc9658bd')

build() {
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
