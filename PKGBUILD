# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-mf2py
_name=${pkgname#python-}
pkgver=1.1.3
pkgrel=1
pkgdesc="Python Microformats2 parser"
arch=('any')
url="https://pypi.org/project/mf2py/"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4241e91ed4b644dd666d9fbd2557ed86e5bb7399c196026f7b0a1f413b33f59f')

build() {
  cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
