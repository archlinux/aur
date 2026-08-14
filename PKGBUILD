# Maintainer: Dily Duan Yi Ong <dlo26@cam.ac.uk>
pkgname=python-unimpeded
_name=${pkgname#python-}
pkgver=1.2.6
pkgrel=1
pkgdesc="Universal model comparison & parameter estimation over diverse datasets"
arch=(any)
url="https://github.com/handley-lab/unimpeded"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(unimpeded)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5cbff55c2854f8ca4379bd266be35937eb32816643956aa4aa1a06abc515765a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

