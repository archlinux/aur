# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dlx
pkgname=python-dlx
pkgver=1.0.4
pkgrel=4
pkgdesc="Implementation of Donald Knuth's Dancing Links algorithm"
arch=('x86_64')
url="https://pypi.org/project/dlx/"
license=('Apache')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('819c8bea96187dff42c6377200ec8be337a1201367cb33a9c2b3a9b152f1fcb90eb69bd255e3dc164611ac787904c5c5512325b1d0c4e309b0911f9777fd18b1')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
