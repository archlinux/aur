# Maintainer: Jan Hambrecht <jaham at gmx dot net>

pkgname=spnavcfg
pkgver=1.0
pkgrel=0
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="https://github.com/FreeSpacenav/spnavcfg"
license=('GPL')
depends=('qt5-base' 'libspnav>=1.0' 'spacenavd>=1.0')
makedepends=('gcc' 'make')
provides=('spnavcfg')
options=()
install=
source=(https://github.com/FreeSpacenav/spnavcfg/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('61e5873cfcbbb40074c0893034956be0')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}
