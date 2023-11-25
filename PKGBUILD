# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-lsbi
_name=${pkgname#python-}
pkgver=0.9.7
pkgrel=1
pkgdesc="Linear Simulation Based Inference"
arch=(any)
url="https://github.com/handley-lab/lsbi"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ff644e4333c36484536ce473ecac130a626626b5bc60d477f4292ae193bc0c6c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

