# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels-redis
_pypi_pkgname=channels_redis
pkgver=3.3.1
pkgrel=1
pkgdesc="Redis-backed ASGI channel layer implementation"
arch=(any)
url=" http://github.com/django/channels_redis/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django-channels' 'python-aioredis1' 'python-msgpack' 'python-asgiref' 'python-async-timeout')
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('899dc6433f5416cf8ad74505baaf2acb5461efac3cad40751a41119e3f68421b')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
