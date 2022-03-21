# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pyex
_pkgname=pyEX
pkgver=0.5.0
pkgrel=1
pkgdesc="Rest API to IEX"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-aiohttp
    python-aiohttp-sse-client
    python-aiostream
    python-deprecation
    ipython
    python-pillow
    python-pandas
    python-pytz
    python-requests
    python-six
    python-socketio-client-nexus
    python-sseclient
    python-temporal-cache
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('e85c392733aec3717b00d05640bd7efcfc87bf949064a7f31112293fe395c27e')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
