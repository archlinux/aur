# Maintainer: Paul Irofti <paul@irofti.net>
_name=dictlearn
pkgname="python-$_name"
pkgver=0.2.2
pkgrel=1

pkgdesc="Dictionary Learning Toolbox"
url="https://gitlab.com/unibuc/graphomaly/dictionary-learning"
arch=('any')
license=('BSD')

depends=(python
  python-certifi
  python-joblib
  python-numpy
  python-scikit-learn
  python-scipy
  python-threadpoolctl)
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('014391e31e9ed87e530a293a780411d41d9805ef306eac5e4cfa090e9fc10769')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 et:
