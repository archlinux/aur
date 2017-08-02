# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.2.9
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point, stable version"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
provides=('upplay')
conflicts=('upplay' 'upplay-git')
depends=('libupnpp>=0.15.3'
         'qt5-webkit'
         'hicolor-icon-theme')
makedepends=('qt5-script')
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
md5sums=('77d3e26f3d96a361f2d83579634ed03d')

build(){
	cd "$srcdir/${pkgname}-${pkgver}"
    qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
