# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-xmlschema
_name=${pkgname#python-}
pkgver=1.0.10
pkgrel=1
pkgdesc="An XML Schema validator and decoder"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-elementpath')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('afa51626412dc75ad3daf693de13c393cfbf2bd9e4e29125e4cb575ceb31f3e3')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
