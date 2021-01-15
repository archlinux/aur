# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.15.5
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
sha256sums=('13fbf2d4785dd96009b5ddcee482db132bc7f2c0129be57330c613f4fc57d55d')
source=("https://github.com/scikit-rf/scikit-rf/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
