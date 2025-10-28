# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=4.3.1
pkgrel=1
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="http://github.com/django/channels"
license=('BSD')
makedepends=(
'python-build'
'python-wheel'
'python-installer'
)
depends=(
'python'
'python-django'
'python-asgiref'
'python-daphne'
)
optdepends=()
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('97413ffd674542db08e16a9ef09cd86ec0113e5f8125fbd33cf0854adcf27cdb')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
