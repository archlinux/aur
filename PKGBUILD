# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-aioredis
_pypi_pkgname=aioredis
pkgver=1.1.0
pkgrel=0
pkgdesc="asyncio (PEP 3156) Redis client library"
arch=(any)
url="https://github.com/aio-libs/aioredis"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'redis')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('ce2046e03166fe9326fa0911ea150e26')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
