# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.3.0
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point, stable version"
url="http://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt5-webkit)
makedepends=(qt5-script)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
sha256sums=('d2c6cdaf1c71219f389277070cd68bb6171b1a20f72212acbde46a356f6e17aa')

build(){
	cd "$srcdir/${pkgname}-${pkgver}"
    qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
