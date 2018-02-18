# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-aioredis
_pypi_pkgname=aioredis
pkgver=1.0.0
pkgrel=0
pkgdesc="asyncio (PEP 3156) Redis client library"
arch=(any)
url="https://github.com/aio-libs/aioredis"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'redis')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('a839519aac8186f0fcd279eab0c394fc')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
