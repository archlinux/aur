# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=smartservoframework
pkgver=0.98
pkgrel=1
pkgdesc="A multi-platform C++ framework used to drive 'smart servo' devices like Dynamixel or HerkuleX actuators."
arch=("armv6h" "i686" "x86_64")
url="https://github.com/emericg/SmartServoFramework"
license=("LGPL3")
makedepends=("cmake")

source=("https://github.com/emericg/SmartServoFramework/archive/v${pkgver}.tar.gz")
sha256sums=('2e3dcc667e7decde7e4e7b0b45c660029930c5cc339d288b0b454838ea89e0fb')

build() {
  mkdir -p "SmartServoFramework-${pkgver}"
  cd SmartServoFramework-${pkgver}/build/

  cmake -DBUILD_STATIC_LIBS:BOOL=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "SmartServoFramework-${pkgver}/build/"
  make DESTDIR="${pkgdir}" install
}

