# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-easydev
_pkgname=${pkgname#python2-}
pkgver=0.9.29
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python2-sphinx')
url="https://pypi.python.org/pypi/$_pkgname"
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('36be9352f38956aaa4bd9ca0a097082f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
