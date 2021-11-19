# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-pycrosskit
_name=${pkgname#python-}
pkgver=1.0.4.1 
pkgrel=1
pkgdesc="Cross Platform Toolkit for Windows and Linux in order to make variables and shortcuts easy"
arch=('any')
url="https://github.com/jiri-otoupal/pycrosskit"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('99273ed6f22aa8a42eca0820d94fec1d335e36a45e8898f4d9ff765d13fda7de')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
