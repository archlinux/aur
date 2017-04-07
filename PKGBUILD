# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Maintainer: Sebastian Krämer <basti.kr@gmail.com>
_name=qutip
_pkgname=qutip
pkgname=python-qutip
pkgver=4.1.0
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=("any")
url="http://qutip.org/index.html"
license=('GPL3')
depends=("python-numpy" "python-scipy" "python-matplotlib" "cython")
makedepends=("gcc-fortran")
optdepends=(
    "blas: Optional, Needed for installing Fortran Monte Carlo solver."
    "mayavi: Optional, Needed for using the Bloch3d class."
    "python-pyqt4: Optional, required only for GUI elements."
    "texlive-bin: Optional, Needed if using LaTeX in figures."
    "python-nose: Optional, For running tests."
    "python-scikit-umfpack: Optional, Faster (~2-5x) steady state calculations." 
)

source=("http://qutip.org/downloads/$pkgver/$_name-$pkgver.tar.gz")
md5sums=('73aefdc714149fa6e1a03de660f2eb2b')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
md5sums=('7a4047aabbc906a84a2a7ca645a6e23a')
