# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pybobyqa
_name=Py-BOBYQA
pkgver=1.3
pkgrel=3
pkgdesc="Python-based Derivative-Free Optimization with Bound Constraints"
arch=(any)
url="https://github.com/numericalalgorithmsgroup/$_name"
license=()
groups=()
depends=(python-numpy python-scipy python-pandas)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(7b0b27b7b9a7cfef94557c8832c0c30757e86764e32878677427381f0691a8fb)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

