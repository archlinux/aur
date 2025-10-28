# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels-redis
_pypi_pkgname=channels_redis
pkgver=4.3.0
pkgrel=1
pkgdesc="Redis-backed ASGI channel layer implementation"
arch=(any)
url=" http://github.com/django/channels_redis/"
license=('BSD')
makedepends=(
'python-setuptools'
)
depends=(
'python'
'python-django-channels'
'python-redis'
'python-msgpack'
'python-asgiref'
)
optdepends=(
'python-cryptography'
)
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('740ee7b54f0e28cf2264a940a24453d3f00526a96931f911fcb69228ef245dd2')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
