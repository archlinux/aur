# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-aioredis
_pypi_pkgname=aioredis
pkgver=1.3.0
pkgrel=1
pkgdesc="asyncio (PEP 3156) Redis client library"
arch=(any)
url="https://github.com/aio-libs/aioredis"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'redis')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('86da2748fb0652625a8346f413167f078ec72bdc76e217db7e605a059cd56e86')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
