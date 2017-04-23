# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname=python-crc16
pkgver=0.1.1
pkgrel=1
pkgdesc="Python Library for calculating CRC16"
arch=('any')
makedepends=('python-setuptools')
url="https://code.google.com/archive/p/pycrc16"
license=('LGPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha512sums=('45d5e8e13b1ac5f885b40516872a9233514f09aa8990915904b214eec2ef6084016f8f0c15bb411aaa1ffc32e8207020916f723e48eee726a7e6989901c9e65d')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
