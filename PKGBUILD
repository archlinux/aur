# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-weather-git
pkgver=5.2
pkgrel=1
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/CareF/deepin-dock-plugin-weather"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CareF/deepin-dock-plugin-weather/archive/${pkgver}.tar.gz")
md5sums=('9ccbdeffe68796a0bb92d44ebdd38230')
_gitname=deepin-dock-plugin-weather

build() {
  qmake "$srcdir/$_gitname-$pkgver"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir/usr" install
}
