# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=django-channels
pkgver=1.1.8
pkgrel=1
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="https://channels.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
optdepends=('python-daphne')
source=("https://pypi.python.org/packages/f7/6f/78ccc77800c96017dba756b4152869472b02d20621fff3af22c4a3a54e30/channels-${pkgver}.tar.gz")
#source=("git://github.com/django/channels")
md5sums=('b13fdf2275e877bec61e4ddf49b30843')

build() {
    cd "${srcdir}/channels-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/channels-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
#    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
