# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-sbi
_name=${pkgname#python-}
pkgver=0.25.0
pkgrel=1
pkgdesc="sbi: simulation-based inference"
arch=(any)
url="https://github.com/sbi-dev/sbi"
license=(APGL3)
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
sha256sums=('e643b6cbf645bb0f59822cda3ae502332bc77fa4bd674abf23306222387e85dd')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

