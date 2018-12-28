# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-weather-git
pkgver=5.1
pkgrel=1
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/sonichy/WEATHER_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sonichy/WEATHER_DDE_DOCK/archive/${pkgver}.tar.gz")
md5sums=('a75e004672b5d8c73f9eca9da57f19ab')
_gitname=WEATHER_DDE_DOCK

build() {
  qmake "$srcdir/$_gitname-$pkgver"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir/usr" install
}
