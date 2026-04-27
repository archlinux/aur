# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.9.10
pkgrel=1
pkgdesc="Qt6 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL-2.0-or-later)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme
         libupnpp.so)
makedepends=(qt6-tools)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('534e6b48850d67c7d40f9463c581002b8e479187df100953cfc1344e56398613')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
  make
}

package(){
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
