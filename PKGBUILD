# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-admin-logs
_pypi_pkgname=django_admin_logs
pkgver=1.5.0
pkgrel=1
pkgdesc="Allows you to either view the django admin log entries from within the admin interface, or to disable them entirely"
arch=(any)
url="https://github.com/radwon/django-admin-logs"
license=('MIT')
makedepends=('python-build' 'python-installer')
depends=('python-django')
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('ce87010b09447ed6ce39ac5d5e7d5c7d19ca3363bf2518499ceb81b9c2ef45c9')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
