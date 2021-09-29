# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-mf2py
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
pkgdesc="Python Microformats2 parser"
arch=('any')
url="https://pypi.org/project/mf2py/"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('84f1f8f2ff3f1deb1c30be497e7ccd805452996a662fd4a77f09e0105bede2c9')

build() {
  cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
