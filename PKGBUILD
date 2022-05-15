# Maintainer: Henry Tung <compgamer89@gmail.com>
pkgname=python-didl-lite
_pkgname=${pkgname}
pkgver=1.3.2
pkgrel=1
pkgdesc="DIDL-Lite tools for Python to read and write DIDL-Lite-xml"
license=('Apache')
arch=('any')
url="https://pypi.org/project/${pkgname}"
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('88c0641d3140f7b05f1efd93f7c481fc62aa50d1e05e17f0e0a15bee025c4af1')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
