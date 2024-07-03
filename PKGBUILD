# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss
pkgver=2.3.1
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD')
depends=('efivar' 'openssl')
source=("https://sourceforge.net/projects/ibmtpm20tss/files/ibmtss$pkgver.tar.gz")
sha256sums=('e40b2988904a6a4d83ebae1ec7efd8113c9ab3117a01fd45285e9552ab88ec32')

build() {
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
