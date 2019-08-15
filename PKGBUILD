# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-log_symbols
_name=${pkgname#python-}
pkgver=0.0.14
pkgrel=1
pkgdesc="Colored symbols for various log levels for Python"
arch=('any')
url="https://github.com/manrajgrover/py-log-symbols"
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cf0bbc6fe1a8e53f0d174a716bc625c4f87043cc21eb55dd8a740cfe22680556')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
