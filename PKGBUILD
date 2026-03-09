# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-margarine
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Posterior Sampling and Marginal Bayesian Statistics"
arch=(any)
url="https://github.com/htjb/margarine"
license=(MIT)
groups=()
depends=(python-tensorflow-probability python-flax python-jax python-optax python-tqdm)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('91b5afe78826468a988bb90f110984dfd88db4fe5ff9d64d98d384ffc7d52559')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

