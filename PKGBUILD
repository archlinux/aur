# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.9.7
pkgrel=1
pkgdesc="Qt6 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL-2.0-or-later)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme
         libupnpp.so)
makedepends=(qt6-tools)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('8c0b9868494b0e68452dce5597fb3247f058f84b7caae7bd2d5bc4d567e14aa7')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
  make
}

package(){
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
