# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-admin-logs
_pypi_pkgname=django_admin_logs
pkgver=1.3.0
pkgrel=0
pkgdesc="Allows you to either view the django admin log entries from within the admin interface, or to disable them entirely"
arch=(any)
url="https://github.com/radwon/django-admin-logs"
license=('MIT')
makedepends=('python-build' 'python-installer')
depends=('python-django')
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('57cd55f2dcc04592729b2778c03b86ba94cc64f5c2e286993114ca16464ff7e9')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
