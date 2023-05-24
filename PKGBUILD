# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=python-psrqpy
_name=${pkgname#python-}
pkgver=1.2.7
pkgrel=1
pkgdesc="A python module to query the ATNF pulsar catalogue"
arch=(any)
url="https://github.com/mattpitkin/psrqpy"
license=('MIT')
makedepends=('python-setuptools')
depends=(
    "python-requests"
    "python-beautifulsoup4"
    "python-numpy"
    "python-scipy"
    "python-astropy"
    "python-pandas"
    "python-ads"
    "python-matplotlib"
)
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(25fe3e00b0a98d6fd813846908bf628927c1d9234df85df705e40698b56bfc8c)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
