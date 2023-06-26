# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-timezone-field
_pypi_pkgname=django_timezone_field
pkgver=5.1
pkgrel=0
pkgdesc="A Django app providing database and form fields for pytz timezone objects"
arch=(any)
url="https://github.com/mfogel/django-timezone-field/"
license=('BSD')
makedepends=(
'python-build'
'python-wheel'
'python-poetry'
)
depends=(
'python'
'python-django'
)
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('73fc49519273cd5da1c7f16abc04a4bcad87b00cc02968d0d384c0fecf9a8a86')


build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE.txt
}
