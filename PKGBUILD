# Maintainer: redponike <proton (dot) me>

pkgname=python-torchdiffeq
_pkgname=${pkgname#python-}
pkgver=0.2.5
pkgrel=1
pkgdesc="Differentiable ODE solvers with full GPU support and O(1)-memory backpropagation. "
depends=('python-pytorch' 'python-scipy' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
arch=('x86_64')
url="https://github.com/rtqichen/torchdiffeq"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b50d3760d13fd138dcceac651f4b80396f44fefcebd037a033fecfeaa9cc12e7')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
