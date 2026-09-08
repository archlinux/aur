# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-sbi
_name=${pkgname#python-}
pkgver=0.27.0
pkgrel=1
pkgdesc="sbi: simulation-based inference"
arch=(any)
url="https://github.com/sbi-dev/sbi"
license=(APGL3)
groups=()
depends=(python-matplotlib python-joblib python-numpy python-pillow python-nflows python-scikit-learn python-scipy python-skorch tensorboard python-pytorch python-tqdm python-zuko)
optdepends=('python-pymc: PyMC posterior sampling' 'python-pyro-ppl: Pyro posterior sampling')
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3e59c832d37612bcd308c24207706e7f47250e7471fd15609f08f91e31b0f17c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
