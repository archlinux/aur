# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-admin-logs
_pypi_pkgname=django_admin_logs
pkgver=1.4.0
pkgrel=1
pkgdesc="Allows you to either view the django admin log entries from within the admin interface, or to disable them entirely"
arch=(any)
url="https://github.com/radwon/django-admin-logs"
license=('MIT')
makedepends=('python-build' 'python-installer')
depends=('python-django')
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('1b3d59f72e36d3d2376c62b5b7966f516f85fe0a70a2a826e112f91bdcfca8d5')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
