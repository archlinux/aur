# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-elementpath
_name=${pkgname#python-}
pkgver=1.1.5
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('94d5496fcbb0046378c1a383ae793f74cfa60a48b8fa9cc397c202b2f7d98c91')

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
