# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Henry Tung <compgamer89@gmail.com>

_pkgname=async_upnp_client
pkgname="python-${_pkgname//_/-}"
pkgver=0.40.0
pkgrel=1
pkgdesc="Asyncio UPnP Client library for Python/asyncio"
license=('Apache-2.0')
arch=('any')
url="https://github.com/StevenLooman/${_pkgname}"
depends=("python" "python-aiohttp" "python-async-timeout" "python-defusedxml" "python-didl-lite" "python-voluptuous")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('179790fee5555dbcaa0523f26ae812bc46790ad36fa11ed295cda5be3d704f1f')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
