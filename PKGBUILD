# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-datatypes
pkgver=0.2.6
pkgrel=1
pkgdesc="Collection of utility classes and functions"
arch=('any')
url="https://github.com/jaymon/datatypes"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/d/datatypes/datatypes-$pkgver.tar.gz")
sha256sums=('9fa6a792c72a86b029ae71c0cda8b719b8ab50b9c56208e5ad49e8af88c98acb')

build() {
	cd "datatypes-$pkgver"
	python setup.py build
}

package() {
	cd "datatypes-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
