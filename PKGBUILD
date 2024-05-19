# Maintainer: Sterophonick
pkgname=ham-libhel
_pkgname='ham-libhel'
pkgver=v2.5
pkgrel=1
pkgdesc='Extension library for HAMlib'
url='http://console-dev.de/project/hel-library-for-gba/'
arch=(x86_64 i686)
depends=(ham-v2.71-linux)
source=(http://www.console-dev.de/libhel/libhel-v25.zip)
md5sums=('e30e47063cd39ffabbacb4de99431e72')
options=(!strip)

package() {
  mkdir -p $pkgdir/opt/ham-gba/gcc-arm/lib
  mkdir -p $pkgdir/opt/ham-gba/include
  mkdir -p $pkgdir/opt/ham-gba/tools

  cp lib/* $pkgdir/opt/ham-gba/gcc-arm/lib
  cp src/hel2.h $pkgdir/opt/ham-gba/include
  cp -r tools/win32 $pkgdir/opt/ham-gba/tools
  cp -r docs $pkgdir/opt/ham-gba/docs
  cp -r demos $pkgdir/opt/ham-gba/hel-demos

  chmod -R 777 $pkgdir/opt/ham-gba
}
