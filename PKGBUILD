# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-aspy-refactor-imports
_name=aspy.refactor_imports
pkgver=2.2.1
pkgrel=1
pkgdesc="Utilities for refactoring imports in python-like syntax."
url="https://github.com/asottile/aspy.refactor_imports"
depends=('python' 'python-cached-property')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f5b2fcbf9fd68361168588f14eda64d502d029eefe632d15094cd0683ae12984')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
