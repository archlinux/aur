# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-weather-git
pkgver=5.3.1
pkgrel=1
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/CareF/deepin-dock-plugin-weather"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CareF/deepin-dock-plugin-weather/archive/${pkgver}.tar.gz")
md5sums=('ceef2d3bc03643eb1273d2cbff9bc591')
_gitname=deepin-dock-plugin-weather

build() {
  qmake "$srcdir/$_gitname-$pkgver"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
