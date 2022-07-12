# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.23.0
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="http://scikit-rf-web.readthedocs.org"
license=("BSD")
depends=("python" "python-numpy" "python-scipy"
	"python-matplotlib" "python-pandas" "python-xlwt"
	"python-openpyxl" "python-networkx")
optdepends=(
	"python-pyvisa: for instrument control"
	"python-vxi11: for instrument control over ethernet"
	"python-xlrd: for xls reading"
)
sha256sums=('df1631e14bf45f90293b163ee2e42f4d8cc509d34cc01bade51b9e863519ecd1')
source=("${pkgname}-${pkgver}::https://github.com/scikit-rf/scikit-rf/archive/refs/tags/v$pkgver.tar.gz")


package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
