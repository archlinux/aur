# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-skidl
pkgver=1.1.0
pkgrel=1
pkgdesc="A Python package for textually describing electronic circuit schematics."
arch=(any)
url="https://github.com/devbisme/skidl"
license=('MIT')
groups=()
depends=('python' 'python-future' 'python-kinparse' 'python-graphviz')
optdepends=('kicad-library: part libraries')
provides=()
options=(!emptydirs)
install=
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('c234586a0f04325254145feb81702b1325f3061741a783ccdc69361759d5489f')


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

