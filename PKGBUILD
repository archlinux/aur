# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay-qt6
pkgver=1.7.2
pkgrel=1
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme)
makedepends=(qt6-tools)
provides=(upplay)
conflicts=(upplay)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('34da7c140f5dacd1245fd6ad076d881c1f770c6ca23359bfe0a08093042b12c2')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package(){
  depends+=(libupnpp.so)
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
