# Contributor: Gordon JC Pearce <gordon@gjcp.net>
# Originally by Chuck Atkins <chuckatkins@gmail.com>
pkgname=ax25-apps
pkgver=0.0.8_rc4
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="Programs for the hamradio protocol AX.25 that would be used by normal users"
arch=('i686' 'x86_64')
url='http://www.linux-ax25.org'
license=('GPL2')
makedepends=('make')
depends=('libax25')
source=("http://www.linux-ax25.org/pub/${pkgname}/${pkgname}-${_pkgver}.tar.xz")
sha1sums=('afa43d8bcfd3218de27d1a2c894a74c911a99fd3')

build() {
	cd $srcdir/${pkgname}-$_pkgver
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
	make clean
	make
}

package() {
	cd $srcdir/${pkgname}-$_pkgver
	make install DESTDIR=$pkgdir
	make installconf DESTDIR=$pkgdir
}
