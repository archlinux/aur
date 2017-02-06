
# Maintainer: Andres F. Urquijo <alfagalileox@gmail.com>
_name=qutip
_pkgname=qutip
pkgname=python2-qutip
pkgver=4.0.2
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=("any")
url="http://qutip.org/index.html"
license=('GPL3')
depends=("python2-numpy" "python2-scipy" "python2-matplotlib")
makedepends=("cython2" "gcc-fortran")
optdepends=(
    "mayavi: Optional. Needed for using the Bloch3d class"
    "python2-pyqt4: Optional, required only for GUI elements"
    "texlive-bin: Optional. Needed if using LaTeX in figures"
    )

source=("http://qutip.org/downloads/$pkgver/$_name-$pkgver.tar.gz")
md5sums=('776efe4ff0019e00ac17073178481ba5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
