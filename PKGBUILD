# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.18
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
sha256sums=('9bbb2bd72bf4df6c367cf351714b500ab9667a3be6d66240479a22a7dacb1c98')
source=("https://github.com/scikit-rf/scikit-rf/archive/refs/tags/v$pkgver.tar.gz")


package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
