# Maintainer: Paul Irofti <paul@irofti.net>
_name=dictlearn
pkgname="python-$_name"
pkgver=0.2
pkgrel=1

pkgdesc="Dictionary Learning Toolbox"
url="https://gitlab.com/unibuc/graphomaly/dictionary-learning"
arch=('any')
license=('Revised BSD')

depends=(python
  python-certifi
  python-joblib
  python-numpy
  python-scikit-learn
  python-scipy
  python-threadpoolctl
)
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0c3f36d28c33dd1af118c8e553a8b26bfd90de3570b0c82a630e97141798377b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -c "from setuptools import setup; setup()" build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -c "from setuptools import setup; setup()" install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
