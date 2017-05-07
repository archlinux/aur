# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgi-redis
_pypi_pkgname=asgi_redis
pkgver=1.3.0
pkgrel=1
pkgdesc="Redis-backed ASGI channel layer implementation"
arch=(any)
url=" http://github.com/django/asgi_redis/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-redis' 'python-msgpack' 'python-asgiref')
source=("https://pypi.io/packages/source/a/asgi_redis/asgi_redis-${pkgver}.tar.gz")
md5sums=('0053239980ed0bf4b773434fcc4c552e')

build() {
    cd "${srcdir}/asgi_redis-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgi_redis-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
