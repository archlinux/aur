# $Id: PKGBUILD 79020 2010-04-30 01:30:58Z dgriffiths $
# Maintainer : James Rayner <iphitus@gmail.com>
# Contributor: Roberto Salas <ro0xito@gmail.com>

pkgname=alltray
pkgver=0.7.4dev
pkgrel=2
pkgdesc="Drops any app in the tray."
license=('GPL')
arch=('i686' 'x86_64')
url="http://alltray.trausch.us/"
depends=('gconf' 'libgtop' 'libwnck')
options=('!libtool' 'force')
source=(https://code.launchpad.net/alltray/trunk/${pkgver}/+download/alltray-${pkgver}.tar.gz)
md5sums=('646d6d751f815e6aeb8a58a9e5d17db9')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install || return 1
}
