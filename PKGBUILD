# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>

pkgname=python-inifile
_pkgname=python-inifile
pkgver=0.4.1
pkgrel=2
pkgdesc="Ini file library for Python."
arch=(any)
url="https://github.com/mitsuhiko/python-inifile"
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://github.com/mitsuhiko/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("3c411ad4454591df3bd07ca3b6c86a20a51480a0225bbebd2162eece3db63e8b")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
