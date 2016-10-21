# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium
pkgver=2.3.0
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPLv3')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus')
makedepends=('cmake')
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4e12b8b4c856e8a89b3bba046837b401')

build() {
  cd Uranium-${pkgver}
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Uranium-${pkgver}/build
  make DESTDIR="${pkgdir}" install

  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
