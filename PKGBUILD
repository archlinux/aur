# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-skidl
pkgver=0.0.22
pkgrel=1
pkgdesc="A Python package for textually describing electronic circuit schematics."
arch=(any)
url="https://xesscorp.github.io/skidl/docs/_site/index.html"
license=('MIT')
groups=()
depends=('python' 'python-future' 'python-kinparse' 'python-graphviz')
optdepends=('kicad-library: part libraries')
provides=()
options=(!emptydirs)
install=
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('94053e73d06785e7b1b963518cad1e9f181bc50dfb694aed50a2b532146d661b')

prepare() {
  cd "$srcdir/$_name-$pkgver"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

