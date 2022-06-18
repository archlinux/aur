# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multitasking
pkgname=python-multitasking
pkgver=0.0.10
pkgrel=2
pkgdesc="Non-blocking Python methods using decorators"
arch=('x86_64')
url="https://github.com/ranaroussi/multitasking"
license=('Apache')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('405b60b914b7b95319c85d519be4124b589689c8bf95c37b9f03430540f309be351086abd5f2c302fc3d6f5171543fc49c1f9009cb2d37e3c5d7e250fba47e88')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
