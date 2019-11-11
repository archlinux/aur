# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.4.2
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt5-webkit)
makedepends=(qt5-script jsoncpp qt5-tools)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
sha256sums=('790adcc4dd427b3dccba0ed8b043baed57f151a5d4242d8ea087aa07f40b3c76')

build(){
  cd "${pkgname}-${pkgver}"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
