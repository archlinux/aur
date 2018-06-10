# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=smartservoframework
pkgver=0.97
pkgrel=1
pkgdesc="A multi-platform C++ framework used to drive 'smart servo' devices like Dynamixel or HerkuleX actuators."
arch=("armv6h" "i686" "x86_64")
url="https://github.com/emericg/SmartServoFramework"
license=("LGPL3")
makedepends=("cmake")

source=("https://github.com/emericg/SmartServoFramework/archive/v${pkgver}.tar.gz")
sha256sums=('2c44cfcbc4dcd03819fd446ec1212c34940b18d1e97309947313114b4cc148f8')

build() {
  mkdir -p "SmartServoFramework-${pkgver}"
  cd SmartServoFramework-${pkgver}/build/

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "SmartServoFramework-${pkgver}/build/"
  make DESTDIR="${pkgdir}" install
}

