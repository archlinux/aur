# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-jstyleson
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="Library to parse JSON with js-style comments."
arch=('any')
url="https://pypi.org/project/jstyleson/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d54954e34d8ea5e1308e')

build() {
  cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
