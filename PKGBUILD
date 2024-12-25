# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=python-psrqpy
_name=${pkgname#python-}
pkgver=1.3.0
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
sha256sums=(ddeabf55fd22a149f9fe0926902443f6a990d13b6d4e820fcff89362a6dee68c)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
