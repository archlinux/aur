# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pep562
_name=${pkgname#python-}
pkgver=1.0
pkgrel=1
pkgdesc="Backport of PEP 562"
arch=('any')
url="https://github.com/facelessuser/pep562"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('58cb1cc9ee63d93e62b4905a50357618d526d289919814bea1f0da8f53b79395')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
