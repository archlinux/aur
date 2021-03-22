# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.16.0
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="http://scikit-rf-web.readthedocs.org"
license=("BSD")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib")
optdepends=(
	"python-pyvisa: for instrument control"
	"python-pandas: for xls export"
	"python-xlrd: for xls reading"
	"python-xlwt: for xls writing"
	"ipython: for interactive shell"
)
sha256sums=('190554acb81ff9ee133dcf25623110b6e6d5b410670be2b4af22172d177019c4')
source=("https://github.com/scikit-rf/scikit-rf/archive/$pkgver.tar.gz")

package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
