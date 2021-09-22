# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xantares

pkgname=python-george
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast Gaussian Processes for regression"
url="https://github.com/dfm/george"
arch=('x86_64')
license=('MIT')
depends=('python-scipy' 'python-numpy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'pybind11')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/george/george-$pkgver.tar.gz")
sha256sums=('3c88304b4a816c41b01198c084e3107ba7b0ab43881c60d249829eb2321245b1')

build() {
	cd "george-$pkgver"
	python setup.py build
}

package() {
	cd "george-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
