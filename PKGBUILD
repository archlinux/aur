# Maintainer: Grey Christoforo <grey[at]christoforo[dot]net>
pkgname=arcus
pkgver=15.06.02
pkgrel=2
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('any')
license=('GPLv3')
makedepends=('cmake')
depends=('protobuf3')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("https://github.com/Ultimaker/libArcus/archive/master.zip")
md5sums=('781f2bd61d652335a26d7f7a17393d29')

build() {
  cd "${srcdir}/libArcus-master"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/libArcus-master/build"
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/lib64  ${pkgdir}/usr/lib
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
