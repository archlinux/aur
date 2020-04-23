# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-allantools
_name=AllanTools
pkgver=2019.9
pkgrel=2
pkgdesc="A python library for calculating Allan deviation and related time & frequency statistics."
license=("LGPL3")
url="https://pypi.python.org/pypi/AllanTools/"
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e95204f688e1ed41602baf4e021ea021c0807bf00d4c2fea94c730f641feab51')
arch=('any')

build() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
