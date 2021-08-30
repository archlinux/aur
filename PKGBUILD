# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_pkgname=${pkgname#python-}
pkgver=0.11.2
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python-sphinx')
url="https://github.com/cokelaer/easydev"
#source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
source=(https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('70aaaa846b49e914691247be93ed01fc9a3497ba7afb2f0e87f0f2ba8df139e0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
