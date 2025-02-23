# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss
pkgver=2.4.1
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD-3-Clause')
depends=('efivar' 'openssl')
source=("https://sourceforge.net/projects/ibmtpm20tss/files/ibmtss$pkgver.tar.gz")
sha256sums=('5468dff16a28e8f7611707e6f86afd206fdef582d6ced5eeedccb40cce51787a')

build() {
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" install
}
