# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.3.8
pkgrel=1
pkgdesc="A Qt5 based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt5-webkit)
makedepends=(qt5-script jsoncpp qt5-tools)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
sha256sums=('c96957dfde556844c01031c49113eae90a728c920550dbe625ef7b1310eb74ad')

build(){
  cd "${pkgname}-${pkgver}"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
