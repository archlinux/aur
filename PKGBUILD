# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-evm-utils
pkgver=1.4
pkgrel=1
pkgdesc='Produce and verify digital signatures which are used by Linux kernel integrity subsystem'
arch=('x86_64')
url='https://github.com/mimizohar/ima-evm-utils'
license=('GPL')
depends=('docbook-xml' 'ibm-tpm2-tss' 'openssl' 'tpm2-tss')
makedepends=('asciidoc')
source=("git+https://github.com/mimizohar/ima-evm-utils.git#tag=v$pkgver")
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
