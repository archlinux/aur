# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>

pkgname=qt5-qpa-surfaceflinger-plugin
conflicts=('qt')
_pkgname=qt5-qpa-surfaceflinger-plugin
_qtver=5.8.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/mickybart/qt5-qpa-surfaceflinger-plugin'
license=('GPL3' 'LGPL' 'custom')
pkgdesc='Qt QPA plugin for Android SurfaceFlinger'
depends=('qt5-base' 'qt5-wayland-hybris' 'hybris-android-headers' 'libhybris')
makedepends=()
source=(${_pkgname}::git+http://github.com/mickybart/qt5-qpa-surfaceflinger-plugin.git#tag=v${_qtver})
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgname}/surfaceflinger/
  make
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir" install
}
