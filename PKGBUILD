# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 18/11/2017

pkgname=libcineform
pkgver=0.1
pkgrel=1
pkgdesc="The GoPro® CineForm video codec SDK."
arch=('x86_64')
url='https://github.com/egrange/libcineform'
license=('MIT, Apache')
makedepends=('cmake')

source=("https://github.com/emericg/libcineform/archive/${pkgver}.tar.gz")
sha256sums=('15122bfdc3839a7f41f62b3df74d8f7f12bb17aa0faea770ca221e395598875e')

build() {
  mkdir -p libcineform-${pkgver}/build/
  cd libcineform-${pkgver}/build/

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd libcineform-${pkgver}/build/
  make prefix="${pkgdir}" DESTDIR="${pkgdir}" install
}

