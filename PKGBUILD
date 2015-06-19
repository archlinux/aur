# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=nolifenx
pkgver=1.0.0
pkgrel=3
pkgdesc='A library to read NX files'
arch=('i686' 'x86_64')
url='https://github.com/NoLifeDev/NoLifeNx'
license=('AGPL')
makedepends=('cmake')
depends=('lz4' 'gcc-libs')
source=("https://github.com/NoLifeDev/NoLifeNx/archive/${pkgver}.tar.gz")
sha1sums=('0bf58d5a84111a423653c6bb33206576c8f6f248')

build() {
  cd NoLifeNx-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd NoLifeNx-${pkgver}/build
  make DESTDIR="$pkgdir/" install
}
