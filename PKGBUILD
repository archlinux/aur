# Contributor: perlawk
# Maintainer: aksr <aksr at t-com dot me>
pkgname=csnobol4
pkgver=2.3.3
pkgrel=1
pkgdesc='A port of Macro SNOBOL4, supports the full SNOBOL4 language plus BLOCKS and SPITBOL and other extensions.'
url='https://www.regressive.org/snobol4/csnobol4/curr/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('tcl' 'tk')
source=("https://ftp.regressive.org/snobol4/${pkgname:1}-${pkgver}.tar.gz")
md5sums=('c43c7216ac21341991b0ba2f4b34c761')
sha1sums=('20f972c7ec28b92627014877935dbd58fb8af54e')
sha256sums=('bfd53071d69283776f5b2764f7865d354b89d372569854a18878e59f57388ed2')

build() {
	cd "$srcdir/${pkgname:1}-$pkgver"
	./configure --prefix=/usr --lp64 --with-tcl=/usr/lib/tclConfig.sh
	make
}

package() {
	cd "$srcdir/${pkgname:1}-$pkgver"
	make DESTDIR="$pkgdir" install
}
