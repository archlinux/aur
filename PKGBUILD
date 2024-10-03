# Maintainer: Paul Irofti <paul@irofti.net>
_name=prophet
pkgname="python-$_name"
pkgver=1.1.6
pkgrel=1
pkgdesc="Automatic Forecasting Procedure"
arch=('any')
url="https://facebook.github.io/prophet/"
depends=('python'
  'python-cmdstanpy'
  'python-numpy'
  'python-matplotlib'
  'python-pandas'
  'python-holidays'
  'python-tqdm'
  'python-importlib_resources')
makedepends=('python-setuptools')
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('92238aa584da69abe5c43e9426e6a4176064465e8424196655915ff86316a680')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
