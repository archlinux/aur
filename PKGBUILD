# Maintainer: Paul Irofti <paul@irofti.net>
_name=graphomaly
pkgname="python-$_name"
pkgver=0.3.1
pkgrel=1

pkgdesc="Find abnormal data in graph and network structures"
url="https://gitlab.com/unibuc/graphomaly/graphomaly"
arch=('any')
license=('BSD')

depends=(python
  python-attrdict3
  python-combo
  python-dictlearn
  python-dirty_cat-git
  python-keras
  python-networkx
  python-numpy
  python-pandas
  python-tqdm
  python-pyod
  python-louvain
  python-pyaml
  python-scikit-learn
  python-scipy
  python-tensorflow
  python-wrapt-timeout-decorator)
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d9e541ff6420b17e2f0bca26faabe768e1b7724e956948d6cdf678d0259f56cb')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 et:
