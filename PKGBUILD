# Maintainer: Henry Tung <compgamer89@gmail.com>
pkgname=python-async-upnp-client
_pkgname=async_upnp_client
pkgver=0.29.0
pkgrel=1
pkgdesc="Asyncio UPnP Client library for Python/asyncio"
license=('Apache')
arch=('any')
url="https://pypi.org/project/${pkgname}"
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python
         'python-voluptuous>=0.12.1'
         'python-aiohttp>=3.7.4'
         'python-async-timeout>=3.0.0'
         'python-async-timeout<5.0.0'
         python-didl-lite
         'python-defusedxml>=0.6.0')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('54ac8a7ce4b15eb3ae3c3f4c5b42a964c58414a187f280c19f67b4cc01771908')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
