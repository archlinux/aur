# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-timezone-field
_pypi_pkgname=django_timezone_field
pkgver=7.0
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
sha256sums=('aa6f4965838484317b7f08d22c0d91a53d64e7bbbd34264468ae83d4023898a7')


build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE.txt
}
