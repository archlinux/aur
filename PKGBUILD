# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=python2-inifile
_pkgname=python-inifile
pkgver=0.3
pkgrel=2
pkgdesc="Ini file library for Python."
arch=(any)
url="https://github.com/mitsuhiko/python-inifile"
license=('BSD')
depends=(python2)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=("https://github.com/mitsuhiko/$_pkgname/archive/$pkgver.tar.gz")
md5sums=("de2ef0f997c880e9d30362310776b652")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
