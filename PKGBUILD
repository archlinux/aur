# Maintainer: BrainDamage
#             adapted from package python2-scikit-rf-git
pkgname="python-scikit-rf-git"
pkgver=0.15.2.r4.gc3a3f80
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="http://scikit-rf-web.readthedocs.org"
license=("BSD")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib")
makedepends=("git")
provides=("python-scikit-rf")
conflicts=("python-scikit-rf")
optdepends=(
	"python-pyvisa: for instrument control"
	"python-pandas: for xls export"
	"python-xlrd: for xls reading"
	"python-xlwt: for xls writing"
	"ipython: for interactive shell"
)
source=("git+https://github.com/scikit-rf/scikit-rf.git")

pkgver() {
	cd "$srcdir/scikit-rf"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
	cd "$srcdir/scikit-rf"
	python setup.py build
}

package() {
	cd "$srcdir/scikit-rf"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
md5sums=('SKIP')
