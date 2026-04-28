# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-sbi
_name=${pkgname#python-}
pkgver=0.26.1
pkgrel=1
pkgdesc="sbi: simulation-based inference"
arch=(any)
url="https://github.com/sbi-dev/sbi"
license=(APGL3)
groups=()
depends=(python-matplotlib python-joblib python-numpy python-pillow python-nflows python-pymc python-pyro-ppl python-scikit-learn python-scipy python-skorch tensorboard python-pytorch python-tqdm python-zuko)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bcdcd9f19318815e8e6314523f23b727b509f02c8e657cf3696c30231d23fc07')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

