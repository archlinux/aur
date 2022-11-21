# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-zope-exceptions
pkgver=4.6
pkgrel=1
pkgdesc="Generic exceptions and implementations for Zope"
arch=('any')
url="https://github.com/zopefoundation/zope.exceptions"
license=('ZPL')
depends=('python38-setuptools' 'python38-zope-interface')
makedepends=('python38-setuptools' 'python38-zope-interface')
checkdepends=('python38-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.exceptions/archive/$pkgver.tar.gz")
sha512sums=('31bb34e3a28fc835b2265126250032591540f2f547f26e8c5fa5b295d6cec5111b1df53cb104df000f9ad4b9e6c2290e86c5bdd356903836068d5367a3e32977')

build() {
  cd zope.exceptions-$pkgver
  python3.8 setup.py build
}

check() {
  cd zope.exceptions-$pkgver
  PYTHONPATH="$PWD/build/lib" zope-testrunner --test-path=src
}

package() {
  cd zope.exceptions-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
