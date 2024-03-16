# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-admin-logs
_pypi_pkgname=django-admin-logs
pkgver=1.2.0
pkgrel=0
pkgdesc="Allows you to either view the django admin log entries from within the admin interface, or to disable them entirely"
arch=(any)
url="https://github.com/radwon/django-admin-logs"
license=('MIT')
makedepends=('python-build' 'python-installer')
depends=('python-django')
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('4bb69c6e2bfaa7bd47ecf5c13674623e2be3b39c1550f39b2500450e6b2bdc62')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
