# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.7.3
pkgrel=1
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme)
depends+=(libupnpp.so)
makedepends=(qt6-tools)
source=("https://www.lesbonscomptes.com/upplay/downloads/upplay-$pkgver.tar.gz")
sha256sums=('4064452daf2ee194489a97a3cc63c0764b40d83ba12bb470745dc5c7849f64dc')

build(){
  cd "upplay-${pkgver}"
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "upplay-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
