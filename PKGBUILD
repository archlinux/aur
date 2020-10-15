# Maintainer: BrainDamage
pkgname="python2-scikit-rf-git"
pkgver=0.14.8.r443.g01716c2f
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="http://scikit-rf-web.readthedocs.org"
license=("BSD")
depends=("python2" "python2-numpy" "python2-scipy" "python2-matplotlib")
makedepends=("git")
provides=("python2-scikit-rf")
conflicts=("python2-scikit-rf")
optdepends=(
	"python2-pyvisa: for instrument control"
	"python2-pandas: for xls export"
	"ipython2: for interactive shell"
)
md5sums=("SKIP")
source=("git+https://github.com/scikit-rf/scikit-rf.git")

pkgver() {
	cd "$srcdir/scikit-rf"
	git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
	cd "$srcdir/scikit-rf"
	python2 setup.py build
}

package() {
	cd "$srcdir/scikit-rf"
	python2 setup.py install --root="$pkgdir/" --prefix="/usr"
}
