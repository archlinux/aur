# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-kinparse
pkgver=0.1.1
pkgrel=2
pkgdesc="Parser for KiCad schematic netlists."
arch=(any)
url="https://xesscorp.github.io/kinparse/docs/_build/singlehtml/index.html"
license=('MIT')
groups=()
depends=('python' 'python-future' 'python-pyparsing')
makedepends=('python-setuptools')
options=(!emptydirs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('8b9e846bf2dc7aa3091e2bc0073003157b7b876be39010ff1dd3bfb505728a43')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

