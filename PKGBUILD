# Contributor: BrainDamage
# Contributor: Jat
# Contributor: xantares

pkgname=python-flask-testing
pkgver=0.8.0
pkgrel=1
pkgdesc="Flask unittest integration"
url="https://github.com/jarus/flask-testing"
arch=(any)
license=('BSD')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
source=("https://github.com/jarus/flask-testing/archive/v${pkgver}.tar.gz")
sha256sums=('b9f6da673a46b2891c44a5963ec14fc405f9b8fed76bad910f47b7c2e9a06733')

_basename="${pkgname#python-}"

build() {
	cd "${srcdir}/${_basename}-${pkgver}"
	python setup.py build
}

package_python-flask-testing() {
	cd "${srcdir}/${_basename}-${pkgver}"
	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
}
