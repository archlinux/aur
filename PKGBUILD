pkgname=python-torchdiffeq
pkgver=0.2.3
pkgrel=1
pkgdesc="Differentiable ODE solvers with full GPU support and O(1)-memory backpropagation. "
depends=('python' 'python-pytorch' 'python-scipy')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/rtqichen/torchdiffeq"
license=('MIT')
source=("https://files.pythonhosted.org/packages/61/7e/629146662e96da319fe237920b7d928a9832cbfa06c1d7ee8cdfe53ed450/torchdiffeq-0.2.3.tar.gz")
sha256sums=('fe75f434b9090ac0c27702e02bed21472b0f87035be6581f51edc5d4013ea31a')

build() {
  cd "${srcdir}/torchdiffeq-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/torchdiffeq-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
