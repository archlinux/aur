# Maintainer: Yang <positivcheg94@gmail.com>
pkgname=librealsense
pkgver=0.9
pkgrel=1
pkgdesc="Librealsense is a cross-platform library (Linux, OSX, Windows) for capturing data from the Intel RealSense F200, SR300 and R200 cameras"
arch=(any)
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=()
depends=('glfw>=3' 'libusb' 'qtcreator')
changelog=''
source=("https://github.com/IntelRealSense/librealsense/archive/v${pkgver}.tar.gz")
md5sums=('8b30a944b51a9ff3fa00f2d1652ae9d9')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {

  cd $srcdir/$pkgname-$pkgver/
  install -m655 -d $pkgdir/usr/lib/$pkgname/ $pkgdir/usr/include/$pkgname/
  cp -r lib/* $pkgdir/usr/lib/
  cp -r include/$pkgname/* $pkgdir/usr/include/
}
