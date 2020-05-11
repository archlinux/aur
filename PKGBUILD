# Maintainer: portaloffreedom

# This is a fork of the PyAIML Python AIML interpreter. 
# It has been refactored to make it install and work in both Python 2.7 and Python 3.

pkgname=python-aiml
pkgver=0.9.3
pkgrel=1
pkgdesc="An interpreter module for AIML (Artificial Intelligence Markup Language), implemented in pure Python (python3 fork)"
url="https://github.com/paulovn/python-aiml"
license=("BSD-2-Clause" 'LGPL')
arch=("any")
depends=('python')
makedepends=('python2')
source=("https://github.com/paulovn/${pkgname}/archive/$pkgver.tar.gz")
sha256sums=('00f418cea5384319c177184cf2c7cf9364fe817dd35b409cf1f542d9d46c6d2b')

build() {
  cd $srcdir/${pkgname}-$pkgver
  python3 setup.py build
}

check() {
  cd $srcdir/${pkgname}-$pkgver
  python2 setup.py test
}

package() {
  cd $srcdir/${pkgname}-$pkgver
  python3 setup.py install --root $pkgdir
}


