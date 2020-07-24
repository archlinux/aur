# Maintainer: Mark Riedesel <mark@klowner.com>
pkgname=rfbproxy
pkgver=1.1.1
pkgrel=0
pkgsuffix=pierre-03
pkgdesc="A program for recording, playback, and video conversion of VNC sessions"
arch=('i686' 'x86_64')
license=('unknown')
makedepends=('make')
url="https://github.com/pmdumuid/rfbproxy"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pmdumuid/rfbproxy/archive/${pkgname}-${pkgver}-${pkgsuffix}.tar.gz)

prepare() {
	mv ${pkgname}-${pkgname}-${pkgver}-${pkgsuffix} \
		${pkgname}-${pkgver}
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}

md5sums=('702488c85ebd9c83df3715be76b389b9')
