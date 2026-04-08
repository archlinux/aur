# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-sbi
_name=${pkgname#python-}
pkgver=0.26.0
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
sha256sums=('92e69f0a8ab59c9fe6ca635c5946024fbcd5ca539f7cf7191bf834d424062a34')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

