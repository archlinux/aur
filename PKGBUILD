# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=aasdk-git
_pkgname=aasdk
pkgver=5edcc7c
pkgrel=1
pkgdesc="Library to build AndroidAuto headunit"
arch=('x86_64')
url="https://github.com/f1xpl/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('cmake' 'protobuf' 'boost' 'libusb' 'openssl')
source=("$pkgname::git+https://github.com/f1xpl/aasdk.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p aasdk_build
  cd aasdk_build
  cmake -DCMAKE_BUILD_TYPE=Release ../  
  make
}

package() {
  mkdir -p "$pkgdir/opt/aasdk"
  cp -Rv $pkgname/* "$pkgdir/opt/aasdk/"
}
