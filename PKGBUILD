# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-weather-git
pkgver=5.7
gitver="v5.7(DeepinV20)"
pkgrel=3
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/sonichy/WEATHER_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
source=("${pkgname}-${gitver}.tar.gz::https://github.com/sonichy/WEATHER_DDE_DOCK/archive/${gitver}.tar.gz")
md5sums=('558a991d2d0d14ec1f9c5fcd4913ebef')
_gitname=WEATHER_DDE_DOCK

build() {
  qmake "$srcdir/$_gitname-$pkgver-DeepinV20-"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir/usr" install
}
