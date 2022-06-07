# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-montepython
_name=${pkgname#python-}
pkgver=3.5.0
pkgrel=3
pkgdesc="The Monte Carlo code for class in Python"
arch=(any)
url="https://github.com/brinckmann/${_name}_public"
license=()
groups=()
depends=("python-class" "python-polychord")
makedepends=("python-setuptools")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('40963df98036e4fddea479de533480b85faca9beb5f6cf52965813323056b89d')

build() {
    cd "$srcdir/montepython_public-$pkgver"
	rm -r montepython/likelihoods/kids450_cf_likelihood_public/CUT_VALUES
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/montepython_public-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
