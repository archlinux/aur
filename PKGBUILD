# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-cobaya
_name=${pkgname#python-}
pkgver=3.6.2
pkgrel=1
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/CobayaSampler/$_name"
license=()
groups=()
depends=(python-numpy python-scipy python-pandas python-yaml python-requests python-pybobyqa python-getdist python-rapidfuzz python-packaging python-tqdm python-portalocker python-dill python-typing_extensions)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8f1061d6347427f08380e1e0c0b766d695d3978b5439fb0b1cc1a7002152d9c8')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
