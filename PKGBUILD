# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-sseclient
_pkgname=${pkgname:7}
pkgver=0.0.27
pkgrel=1
pkgdesc="Python client library for reading Server Sent Event streams."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-six)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b2fe534dcb33b1d3faad13d60c5a7c718e28f85987f2a034ecf5ec279918c11c')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
