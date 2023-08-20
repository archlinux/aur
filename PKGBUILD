# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-montepython
_name=${pkgname#python-}
pkgver=3.6.0
pkgrel=1
pkgdesc="The Monte Carlo code for class in Python"
arch=(any)
url="https://github.com/brinckmann/${_name}_public"
license=()
groups=()
depends=(python-class python-polychord)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4bcd795e7e9476a5a63fd193caf16c53e4c38686afd2a215df2e4d51a21f2f46')

build() {
    cd "$srcdir/montepython_public-$pkgver"
	rm -r montepython/likelihoods/kids450_cf_likelihood_public/CUT_VALUES
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/montepython_public-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
