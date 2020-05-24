# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.4.0
pkgrel=1
pkgdesc='Python package for 3D CAD/BIM/PLM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu')
makedepends=('cmake' 'swig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a25705479e32f93422497f7828062188eb99ad22f679996ca35d63a57c7335cfe0d965d8b4f88967e4a44bec3ebaec2ee47572e61dce275c6c645d983e1480c7')

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $_pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}

