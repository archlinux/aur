pkgbase=python-sphinxcontrib-plantuml
pkgname=(python-sphinxcontrib-plantuml python2-sphinxcontrib-plantuml)
_pyname=sphinxcontrib-plantuml
pkgver=0.7
pkgrel=1
arch=(any)
pkgdesc="Sphinx 'plantuml' extension"
url='https://pypi.python.org/pypi/sphinxcontrib-plantuml'
license=('BSD')
makedepends=(python-setuptools python2-setuptools)
source=("https://pypi.python.org/packages/source/s/${_pyname}/${_pyname}-${pkgver}.tar.gz")

build() {
  cp -r $_pyname-$pkgver $_pyname-$pkgver-py2

  cd $_pyname-$pkgver
  python setup.py build

  cd "$srcdir"/$_pyname-$pkgver-py2
  python2 setup.py build
}

package_python-sphinxcontrib-plantuml() {
  depends=('plantuml' 'python-sphinx')
  cd $_pyname-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-sphinxcontrib-plantuml() {
  depends=('plantuml' 'python2-sphinx')
  cd $_pyname-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('9b33b30ceb3a53c8af3291d66b902821a4b81117f37d2250a8ac05e270be3e04')
