# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-unimpeded
_name=${pkgname#python-}
pkgver=0.2.8
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
sha256sums=('730ff5912e50204dcc88462f37ee3e9ab997f44ac0f76979d963fb369fd0b103')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

