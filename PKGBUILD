# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-elementpath
_name=${pkgname#python-}
pkgver=1.1.8
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c1aec0aec576fdb8fe6ade696b3fc370a8bb709af8b6d1aeb62e4a4396878da9')

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
