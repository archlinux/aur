# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname=python2-crc16
pkgver=0.1.1
pkgrel=1
pkgdesc="Python Library for calculating CRC16"
arch=('any')
makedepends=('python2-setuptools')
url="https://code.google.com/archive/p/pycrc16"
license=('LGPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
sha512sums=('45d5e8e13b1ac5f885b40516872a9233514f09aa8990915904b214eec2ef6084016f8f0c15bb411aaa1ffc32e8207020916f723e48eee726a7e6989901c9e65d')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
