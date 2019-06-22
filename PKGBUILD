# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-xmlschema
_name=${pkgname#python-}
pkgver=1.0.13
pkgrel=1
pkgdesc="An XML Schema validator and decoder"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-elementpath')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4e5c9114ed65e29fd6ae9827f8c563a4dbb419fd9640b505857799bd7dd09150')

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
