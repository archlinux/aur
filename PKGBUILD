# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>

pkgname=python-inifile
_pkgname=python-inifile
pkgver=0.4
pkgrel=1
pkgdesc="Ini file library for Python."
arch=(any)
url="https://github.com/mitsuhiko/python-inifile"
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://github.com/mitsuhiko/$_pkgname/archive/$pkgver.tar.gz")
md5sums=("43ddbcc456398995fca9873f0f77eca4")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
