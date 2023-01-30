# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>

pkgname=python-inifile
_pkgname=python-inifile
pkgver=0.4.1
pkgrel=1
pkgdesc="Ini file library for Python."
arch=(any)
url="https://github.com/mitsuhiko/python-inifile"
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://github.com/mitsuhiko/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=("b5fc578e078f7bfdc4cc9307692a9da42e4c25e9d6baea9ba70638029f2d0742")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
