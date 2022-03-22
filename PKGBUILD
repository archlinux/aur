# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-getdist
_name=GetDist
pkgver=1.3.4
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/$_name"
license=()
groups=()
depends=(python-numpy python-matplotlib python-six python-scipy pyside2 python-pandas)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bc007b91fb3cbb0947ef4b6558cbb21a20038b31361a43751f70794c1c6e0721')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
