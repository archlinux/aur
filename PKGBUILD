# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-cobaya
_name=${pkgname#python-}
pkgver=3.1.1
pkgrel=3
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/CobayaSampler/$_name"
license=()
groups=()
depends=(python-numpy python-scipy python-pytz python-six python-dateutil python-pandas python-yaml wget python-pybobyqa python-kiwisolver python-pyparsing python-cycler python-matplotlib python-getdist python-fuzzywuzzy pyside2)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('03b50d5a0bed89f5c2b014f610a2a7b052e1a65e639b578eca89a13975df09c3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
