# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-log_symbols
_name=${pkgname#python-}
pkgver=0.0.13
pkgrel=1
pkgdesc="Colored symbols for various log levels for Python"
arch=('any')
url="https://github.com/manrajgrover/py-log-symbols"
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ecc2f8f3ee586fd819d8c8696705914761cd8367d1f10597b9b49a0980ab6e55')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
