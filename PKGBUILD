# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-cobaya
_name=${pkgname#python-}
pkgver=3.5.1
pkgrel=2
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
sha256sums=('1002f0b1d3e79710c41bbf62a64c0b4e52eeb4a7617e100c32d5b00bbaf83628')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
