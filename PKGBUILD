# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=asgi-middleware-static-file
_pipname=ASGIMiddlewareStaticFile
pkgname="python-${_pkgname}"
pkgver=0.6.1
pkgrel=1
pkgdesc="ASGI Middleware for serving static file."
arch=("any")
url="https://github.com/rexzhang/asgi-middleware-static-file"
license=('MIT')
depends=('python-aiofiles')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('3bd2c8cfce4bdcb00ef570cd84d072e9f004d159568e6d1bbc72438d9936ca2a')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
