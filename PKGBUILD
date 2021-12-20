# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_pkgname=${pkgname#python-}
pkgver=0.12.0
pkgrel=2
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python-sphinx')
url="https://github.com/cokelaer/easydev"
#source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
source=(https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('f4a340c5ffe193654c387d271bcd466d1fe56bf9850f2704122d3b52b1e6090d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
