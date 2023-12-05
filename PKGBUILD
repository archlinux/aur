# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-nflows
_name=${pkgname#python-}
pkgver=0.14
pkgrel=1
pkgdesc="conditional density estimation"
arch=(any)
url="https://github.com/bayesiains/nflows"
license=(MIT)
groups=()
depends=(python-matplotlib python-numpy tensorboard python-pytorch python-tqdm)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6299844a62f9999fcdf2d95cb2d01c091a50136bd17826e303aba646b2d11b55')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

