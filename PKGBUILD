# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.7.8
pkgrel=1
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL-2.0-or-later)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme
         libupnpp.so)
makedepends=(qt6-tools)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('91508b902037f4026fbee3b2f3120446113c083f77e3aaa4c393a6f4291903f8')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
