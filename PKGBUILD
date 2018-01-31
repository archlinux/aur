# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.2.12
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point, stable version"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
provides=('upplay')
conflicts=('upplay' 'upplay-git')
depends=('libupnpp>=0.16.1'
         'qt5-webkit'
         'hicolor-icon-theme')
makedepends=('qt5-script')
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
md5sums=('c291b78ac90187016b5294fa546d0d75')

build(){
	cd "$srcdir/${pkgname}-${pkgver}"
    qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
