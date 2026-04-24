# Contributor: perlawk
# Maintainer: aksr <aksr at t-com dot me>
pkgname=csnobol4
pkgver=2.3.4
pkgrel=1
pkgdesc='A port of Macro SNOBOL4, supports the full SNOBOL4 language plus BLOCKS and SPITBOL and other extensions.'
url='https://www.regressive.org/snobol4/csnobol4/curr/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('tcl' 'tk')
source=("https://ftp.regressive.org/snobol4/${pkgname:1}-${pkgver}.tar.gz")
md5sums=('b2ee9c9ca99438d23a6dbc94f7509d7a')
sha1sums=('1141f69d20a094fc2ec2799e971507921324a8fd')
sha256sums=('702f73b4107438bd251ebc253d335994f37bb40379242360d876e2de6dc03f78')

build() {
	cd "$srcdir/${pkgname:1}-$pkgver"
	./configure --prefix=/usr --lp64 --with-tcl=/usr/lib/tclConfig.sh
	make
}

package() {
	cd "$srcdir/${pkgname:1}-$pkgver"
	make DESTDIR="$pkgdir" install
}
