# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=upplay
pkgver=1.6.0
pkgrel=1
pkgdesc="Qt5 based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL2)
depends=(libupnpp qt5-webkit qtmpris jsoncpp)
makedepends=(qt5-script qt5-tools)
source=("https://www.lesbonscomptes.com/${pkgname}/downloads/${pkgname}-$pkgver.tar.gz")
sha256sums=('672fd1839c0117e642bc966aa5092f28536481d6e553595a75a6a9dc626b4f45')

build(){
  cd "${pkgname}-${pkgver}"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package(){
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
