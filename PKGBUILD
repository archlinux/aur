# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-ultranest
_name=${pkgname#python-}
pkgver=3.6.4
pkgrel=1
pkgdesc="Fit and compare complex models reliably and rapidly with advanced sampling techniques."
arch=(any)
url="https://github.com/JohannesBuchner/ultranest"
license=(GPL3)
groups=()
#depends=(cython python-numpy python-scipy python-matplotlib python-corner python-h5py python-pandas flake8 python-coveralls python-pytest-html python-pytest-xdist python-sphinx_rtd_theme python-sphinx python-nbsphinx python-fastkde python-getdist python-nbstripout python-mpi4py)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('23a1a442fe65137e427fc5b0ccaf625a67f0bb1d7cbeb5ec79621890d4000db2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

