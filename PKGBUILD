# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-nimfa
pkgver=1.4.0
pkgrel=1
pkgdesc="Nonnegative matrix factorization in Python"
arch=('any')
url='https://github.com/mims-harvard/nimfa'
license=('BSD')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/nimfa/nimfa-$pkgver.tar.gz")
sha256sums=('39cff2b86856d03ca8a3d9c38598034ecf1a768c325fd3a728bb9eadb8c6b919')

build(){
	cd "nimfa-$pkgver"
	python setup.py build
}

# check() {
# 	pushd "nimfa-$pkgver"
# 	python setup.py pytest
# }

package_python-nimfa() {
	cd "nimfa-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
	install -Dm 644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
