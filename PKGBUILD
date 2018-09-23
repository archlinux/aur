# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.2.13
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point, stable version"
url="http://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686)
license=(GPL2)
depends=(libupnpp qt5-webkit hicolor-icon-theme)
makedepends=(qt5-script)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
md5sums=('b61ca8888980d30a8dae814685dbb6da')

build(){
	cd "$srcdir/${pkgname}-${pkgver}"
    qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
