# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=wbxml2
pkgver=0.9.2
pkgrel=5
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('i686' 'x86_64')
url="http://libwbxml.aymerick.com"
license=(GPL)
depends=('zlib' 'expat' 'popt' 'libxml2')
makedepends=('libtool' 'autoconf' 'm4' 'automake')
source=(http://downloads.sourceforge.net/sourceforge/wbxmllib/${pkgname}-${pkgver}.tar.gz)
md5sums=('67a48fd9b69db8818a4dca5375c7993a')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	chmod +x bootstrap
	./bootstrap
	mkdir doc
	touch doc/empty
	./configure --prefix=/usr
	make all || return 1
	make DESTDIR=${startdir}/pkg install
}

