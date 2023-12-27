# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.7.2
pkgrel=2
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt5-base qt5-webkit qtmpris jsoncpp glibc gcc-libs hicolor-icon-theme)
makedepends=(qt5-script qt5-tools)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
sha256sums=('34da7c140f5dacd1245fd6ad076d881c1f770c6ca23359bfe0a08093042b12c2')

build(){
  cd "${pkgname}-${pkgver}"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
  depends+=(libupnpp.so)
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
