# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-getdist
_name=${pkgname#python-}
pkgver=1.7.5
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/$_name"
license=()
groups=()
depends=(python-numpy python-matplotlib python-six python-scipy pyside6 python-pandas)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b0295c10e861db3ed9439eac88d8dc452e93d67173b5723756b0658b9694f98c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
