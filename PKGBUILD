# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pyknos
_name=${pkgname#python-}
pkgver=0.15.2
pkgrel=1
pkgdesc="conditional density estimation"
arch=(any)
url="https://github.com/mackelab/pyknos"
license=(AGPL3)
groups=()
depends=(python-matplotlib python-numpy tensorboard python-pytorch python-tqdm python-nflows)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ee09ea841858e79ed9f3e104b6654aea676f3403a2f228ef76151e108968caf3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

