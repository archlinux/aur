# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-admin-logs
_pypi_pkgname=django-admin-logs
pkgver=1.0.2
pkgrel=0
pkgdesc="Allows you to either view the django admin log entries from within the admin interface, or to disable them entirely"
arch=(any)
url="https://github.com/radwon/django-admin-logs"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-django')
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('aedb5df940d32c10423d65136343bc009727df8a5a49ed0196e65241d823a890')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
