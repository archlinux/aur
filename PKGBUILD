# $Id$
# Maintainer: elao `echo "PGVsYWZvbiAqIEFUICogb2N0byAqIERPVCAqIGNvbT4K" | base64 -d `
# Committer: Manolis Tzanidakis <manolis@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=xclip-svn
pkgver=r85
pkgrel=2
pkgdesc='Command line interface to the X11 clipboard - SVN version'
url='http://sourceforge.net/projects/xclip'
license=('GPL')
depends=('libxmu')
conflicts=('xclip')
provides=('xclip')
arch=('i686' 'x86_64')
source=("svn://svn.code.sf.net/p/xclip/code/trunk@${pkgver}")
sha1sums=('SKIP')

build() {
	cd ${srcdir}/trunk@${pkgver}/ 
	
	# Generate the configure script
	autoconf
	
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/trunk@${pkgver}/ 
	make DESTDIR="${pkgdir}" install
}
