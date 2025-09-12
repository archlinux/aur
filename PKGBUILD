# Maintainer: Paul Irofti <paul@irofti.net>
_name=prophet
pkgname="python-$_name"
pkgver=1.1.7
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
sha256sums=('97ef633a7d2d3bb7237f58b6990a68467c3c8089f605ea364b03f842ab3ea9cf')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
