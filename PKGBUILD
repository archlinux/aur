# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-sbi
_name=${pkgname#python-}
pkgver=0.22.0
pkgrel=2
pkgdesc="sbi: simulation-based inference"
arch=(any)
url="https://github.com/sbi-dev/sbi"
license=(MIT)
groups=()
depends=(python-matplotlib python-arviz python-joblib python-numpy python-pillow python-pyknos python-pyro-ppl python-scikit-learn python-scipy tensorboard python-pytorch python-tqdm)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e632994c0bcfbc63c110d6eb04c6e1bdf6ae4ca42211d67ab4946d9b394dc360')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

