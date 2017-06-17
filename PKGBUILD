# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=django-channels
pkgver=1.1.5
pkgrel=2
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="https://channels.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
optdepends=('python-daphne')
source=("git://github.com/django/channels")
md5sums=('SKIP')

build() {
    cd "${srcdir}/channels"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/channels"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
