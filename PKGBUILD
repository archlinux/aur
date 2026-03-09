# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-cobaya
_name=${pkgname#python-}
pkgver=3.6.1
pkgrel=1
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/CobayaSampler/$_name"
license=()
groups=()
depends=(python-numpy python-scipy python-pytz python-six python-dateutil python-pandas python-yaml wget python-pybobyqa python-kiwisolver python-pyparsing python-cycler python-matplotlib python-getdist python-fuzzywuzzy pyside6)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9fb404903e8e221b73879f296e8d5b27c8ae5879d03ad7e86f05c9d3ce42a4c5')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
