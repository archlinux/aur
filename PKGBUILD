# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-pyprind
_name=PyPrind
pkgver=2.11.2
pkgrel=5
pkgdesc='Python Progress Bar and Percent Indicator Utility'
arch=('any')
url='https://pypi.python.org/pypi/PyPrind/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-psutil: improved system information')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c46cab453b805852853dfe29fd933aa88a2a516153909c695b098e9161a9e675')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py test
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
