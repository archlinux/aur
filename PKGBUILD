# $Id: PKGBUILD 250288 2015-11-09 21:13:39Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde-base-artwork
pkgver=15.08.3
pkgrel=1
pkgdesc="KDE KSplash theme"
arch=('any')
url='http://www.kde.org/'
license=('LGPL')
makedepends=('kdelibs' 'cmake' 'automoc4')
source=("https://download.kde.org/Attic/applications/${pkgver}/src/${pkgname}-${pkgver}.tar.xz")
sha1sums=('c08dd2b5e88a3357215d020d522ce83f2f75101a')

build() {
	cd $srcdir
	mkdir -p build
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd $srcdir/build
	make DESTDIR=$pkgdir install
}
