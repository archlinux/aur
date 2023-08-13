# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay-qt6
pkgver=1.6.6
pkgrel=1
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt6-base qt6-webengine jsoncpp)
makedepends=(qt6-tools)
provides=(upplay)
conflicts=(upplay)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('d1e23f6c287a4a81f4fa104fa56d08e0934bd7a16c2007333adfe9adc3df27a4')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
