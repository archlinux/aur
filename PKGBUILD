# Maintainer: Derek Brown <derek@allderek.com>

pkgname=imageclipper-git
pkgver=1.0.1
pkgrel=1
pkgdesc="An imageclipper intended for using when creating OpenCV haar cascade sample images."
url="https://github.com/JoakimSoderberg/imageclipper"
arch=('x86_64' 'i686')
license=('MIT')
depends=('opencv>=3.1.0-2' 'boost>=1.66.0-1' 'boost-libs>=1.66.0-1')
makedepends=('cmake>=3.1.3-1')
source=("git+https://github.com/JoakimSoderberg/imageclipper.git")
md5sums=('SKIP')

package() {

  # Build
  cd $srcdir/imageclipper
  mkdir build && cd build
  cmake ..
  cmake --build .

  # Copy Binary
  mkdir -p $pkgdir/usr/bin
  cp ./bin/imageclipper $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/imageclipper
}
