# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-mf2py
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python Microformats2 parser"
arch=('any')
url="https://pypi.org/project/mf2py/"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1380924633413b8d72e704b5c86b4382c4b1371699edecc907b01cd21138d7cd')

build() {
  cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
