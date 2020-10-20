# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=sigpy
pkgname=${_name}
pkgver=0.1.21
pkgrel=1
pkgdesc="A package for signal processing, with emphasis on iterative methods."
arch=('any')
url="https://github.com/mikgroup/sigpy"
license=('BSD')
depends=('python>=3.5' 'python-tqdm' 'python-numpy' 'python-numba' 'python-pywavelets')
makedepends=('python-setuptools')
optdepends=('python-cupy: CUDA support' 'python-matplotlib: plotting' 'python-mpi4py: MPI support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9e5e58ed155502bbe97267db6821a0831f42edd8b6e58e8d0be767d4e49f2137')
  

package() {
  cd "$srcdir"/${_name}-${pkgver}
  python setup.py install --root="$pkgdir"/ --optimize=1
}
