# $Id$
# Maintainer: John Lindgren <john.lindgren@aol.com>

pkgname=libaudclient
pkgver=3.4.90 # 3.5-rc2
pkgrel=1
pkgdesc='Legacy D-Bus client library for Audacious'
url='http://audacious-media-player.org/'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('glib2' 'dbus-glib')
source=("http://distfiles.audacious-media-player.org/${pkgname}-3.5-rc2.tar.bz2")
sha1sums=('150ae0469f017da9322d456295aa9257d9be84af')

build() {
	cd "${srcdir}/${pkgname}-3.5-rc2"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-3.5-rc2"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}