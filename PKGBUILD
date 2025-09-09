# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pybobyqa
_name=Py-BOBYQA
pkgver=1.5.0
pkgrel=1
pkgdesc="Python-based Derivative-Free Optimization with Bound Constraints"
arch=(any)
url="https://github.com/numericalalgorithmsgroup/$_name"
license=()
groups=()
depends=(python-numpy python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/py_bobyqa-$pkgver.tar.gz")
sha256sums=('3c7719b68b28834ea6d538f54603f6a891263f7c21f1a673de79e3a5e0e7e413')
build() {
    cd "$srcdir/py_bobyqa-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/py_bobyqa-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

