# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-lsbi
_name=${pkgname#python-}
pkgver=0.8.0
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
sha256sums=('9b4547639ce29892cb6359c895f8d0dbbb88972ef1414aac5da108dfa3dd5a45')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

