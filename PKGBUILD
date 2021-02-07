# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-skidl
pkgver=0.0.30
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
sha256sums=('d4f3a544368ee1a6061f86b610fe54941268e0ebd0ac890c4e095675fb9ee7b4')


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

