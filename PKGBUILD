# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-swyft
_name=${pkgname#python-}
pkgver=0.4.5
pkgrel=1
pkgdesc="swyft is the official implementation of Truncated Marginal Neural Ratio Estimation (TMNRE), a hyper-efficient, simulation-based inference technique for complex data and expensive simulators."
arch=(any)
url="https://github.com/undark-lab/swyft"
license=('Apache')
groups=()
depends=(python-toolz python-numpy python-pytorch python-pytorch-lightning python-zarr python-matplotlib python-scipy python-torchist python-fasteners)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('59b7c8f846fa858c20b15b3fdc7555386a644ef40fb76aedd60277448f61ddf4')


build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

