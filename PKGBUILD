# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-easydev
_pkgname=${pkgname#python2-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python2-sphinx')
url="https://pypi.python.org/pypi/$_pkgname"
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('138187b9938a5a00e979816c38d2c96b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

