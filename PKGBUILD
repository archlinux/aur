# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-easydev
_pkgname=${pkgname#python-}
pkgver=0.11.1
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python-sphinx')
url="https://github.com/cokelaer/easydev"
#source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
source=(https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2915371b04238e967bfaa2a843c9cf8a59eb706b8cbcac4ccd1d5b3e6249b72a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
