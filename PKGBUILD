# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels-redis
_pypi_pkgname=channels_redis
pkgver=2.1.1
pkgrel=0
pkgdesc="Redis-backed ASGI channel layer implementation"
arch=(any)
url=" http://github.com/django/channels_redis/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django-channels' 'python-aioredis' 'python-msgpack' 'python-asgiref' 'python-async-timeout')
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('aeb4b272f2c157926616cfb8a0e56644')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
