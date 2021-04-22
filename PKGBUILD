# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-libdc
_pkgname=libdivecomputer-subsurface-branch
pkgver=4.9.10
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='https://github.com/Subsurface-divelog/libdc'
license=('LGPL')
arch=('x86_64')
source=("https://subsurface-divelog.org/downloads/${_pkgname}-${pkgver}.tgz")
sha256sums=('89cf2bf07351ea379b1591a08588af4122af4d8f133c0898923ac0363a89a6de')
depends=('glibc')

prepare() {
  cd ${_pkgname}-${pkgver}
  autoreconf --install
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
