# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 18/11/2017

pkgname=libcineform
pkgver=0.2
pkgrel=1
pkgdesc="The GoPro® CineForm video codec SDK."
arch=('x86_64')
url='https://github.com/egrange/libcineform'
license=('MIT, Apache')
makedepends=('cmake')

source=("https://github.com/emericg/libcineform/archive/v${pkgver}.tar.gz")
sha256sums=('7749cc6ccbd2b05ac8c942045396f06735dda5a87f5cd0166752570fd2be0cac')

build() {
  mkdir -p libcineform-${pkgver}/build/
  cd libcineform-${pkgver}/build/

  cmake -DBUILD_STATIC_LIBS:BOOL=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd libcineform-${pkgver}/build/
  make DESTDIR="${pkgdir}" install
}
