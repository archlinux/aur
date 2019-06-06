# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-kinparse
pkgver=0.1.2
pkgrel=1
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
sha256sums=('01b58c997169649988a9a33392fd7e0a6afd40b288643dc6de1ba685d289bab7')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

