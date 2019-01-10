# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-weather-git
pkgver=5.3
pkgrel=2
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/CareF/deepin-dock-plugin-weather"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CareF/deepin-dock-plugin-weather/archive/${pkgver}.tar.gz")
md5sums=('62285a0d209e602a545e16070bf26d2b')
_gitname=deepin-dock-plugin-weather

build() {
  qmake "$srcdir/$_gitname-$pkgver"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
