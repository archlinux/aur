# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-evm-utils
pkgver=1.3.2
pkgrel=1
pkgdesc='Produce and verify digital signatures which are used by Linux kernel integrity subsystem'
arch=('x86_64')
url='https://sourceforge.net/p/linux-ima/ima-evm-utils/ci/master/tree/'
license=('GPL')
depends=('docbook-xml' 'ibm-tpm2-tss' 'openssl' 'tpm2-tss')
source=("git+https://git.code.sf.net/p/linux-ima/ima-evm-utils#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
