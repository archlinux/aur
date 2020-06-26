# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.2.3
pkgrel=1
pkgdesc="Object oriented headers, HTTP/1.1 style. Also parse headers."
arch=('any')
url="https://www.kiss-headers.tech"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7744b7c1e1de7c0b5778605f05f9e136cf6282eba917cce1ea643d9bbf14eba6')

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
