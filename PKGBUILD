# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-elementpath
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1701da8d78ab21d484ce2cb285af357fe39b9a74034edd86582aaf41ca17d6eb')

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
