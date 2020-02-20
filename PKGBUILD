# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-spinners
_name=${pkgname#python-}
pkgver=0.0.24
pkgrel=1
pkgdesc="Spinners for terminal, python wrapper for amazing node library cli-spinners"
arch=('any')
url="https://github.com/ManrajGrover/py-${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1eb6aeb4781d72ab42ed8a01dcf20f3002bf50740d7154d12fb8c9769bf9e27f')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
