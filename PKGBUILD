# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-fgivenx
_name=${pkgname#python-}
pkgver=2.5.2
pkgrel=1
pkgdesc="Functional Posterior Plotter"
arch=(any)
url="https://github.com/williamjameshandley/fgivenx"
license=('MIT')
groups=()
depends=(python-numpy python-matplotlib python-scipy python-joblib python-mpi4py python-tqdm)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0e2ce781d4022337c6a5676f9aa050c6de12461cef0a8f1f721952a14c7f91bd')
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

