# Contributor: perlawk
# Maintainer: aksr <aksr at t-com dot me>
pkgname=csnobol4
_pkgname=snobol4
pkgver=2.3.1
pkgrel=1
pkgdesc='A port of Macro SNOBOL4, supports the full SNOBOL4 language plus BLOCKS and SPITBOL and other extensions.'
url='https://www.regressive.org/snobol4/csnobol4/curr/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('tcl' 'tk')
source=("https://ftp.regressive.org/snobol4/${_pkgname}-${pkgver}.tar.gz")
md5sums=('aa4c9f7144e2a753103462067c546bff')
sha1sums=('c9243886c4970d8b298f2e1d0a19eeecf9802dc0')
sha256sums=('91244d67d4e29d2aadce5655bd4382ffab44c624a7ea4ad6411427f3abf17535')

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	./configure --prefix=/usr --lp64 --with-tcl=/usr/lib/tclConfig.sh
	make
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	make DESTDIR="$pkgdir" install
}
