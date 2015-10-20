# $Id: PKGBUILD 188496 2013-06-15 04:38:11Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=arora
pkgver=0.11.0
pkgrel=4
pkgdesc='Lightweight cross-platform Web browser'
url='http://code.google.com/p/arora/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qtwebkit' 'desktop-file-utils')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('480cfd7482cccbb7ece866fa10afe9acace29b31')

install=install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX='/usr' 'CONFIG-=debug' -r
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
}
