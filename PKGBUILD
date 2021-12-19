# Maintainer: Philipp A. <flying-sheep@web.de>

_name=goatools
pkgname=python-$_name
pkgver=1.1.6
pkgrel=1
pkgdesc='Python scripts to find enrichment of GO terms'
arch=(any)
url="https://github.com/tanghaibao/$_name"
license=(BSD)
# it doesn’t actually use a python module called wget
depends=(python python-pandas python-numpy python-scipy python-xlsxwriter python-statsmodels python-xlrd python-docopt python-pydot python-requests)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b631a6a803818673ac815ed5f1e7158d1bd98a3ce5c93b64961dc73bdea56bca')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
