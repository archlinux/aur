# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-kinparse
pkgver=1.1.0
pkgrel=1
pkgdesc="Parser for KiCad schematic netlists."
arch=(any)
url="https://github.com/devbisme/kinparse"
license=('MIT')
groups=()
depends=('python' 'python-future' 'python-pyparsing')
makedepends=('python-setuptools')
options=(!emptydirs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('1d951aa25688a7485edb69810ffcb5257df1803b78490dc680b8138d5fdc56e3')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

