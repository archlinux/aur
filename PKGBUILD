# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-iteration-utilities
_name=${pkgname#python-}
pkgver=0.11.0
pkgrel=1
pkgdesc="Utilities based on Pythons iterators and generators."
url="https://github.com/MSeifert04/iteration_utilities"
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-pytest'
    'python-sphinx'
    'python-numpydoc'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f91f41a2549e9a7e40ff5460fdf9033b6ee5b305d9be77943b63a554534c2a77')

build() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
