# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=sigpy
pkgname=${_name}
pkgver=0.1.21
pkgrel=2
pkgdesc="A package for signal processing, with emphasis on iterative methods."
arch=('any')
url="https://github.com/mikgroup/sigpy"
license=('BSD')
depends=('python>=3.5' 'python-tqdm' 'python-numpy' 'python-numba' 'python-pywavelets')
makedepends=('python-setuptools')
optdepends=('python-cupy: CUDA support' 'python-matplotlib: plotting' 'python-mpi4py: MPI support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/mikgroup/${pkgname}/master/LICENSE")
 sha256sums=('9e5e58ed155502bbe97267db6821a0831f42edd8b6e58e8d0be767d4e49f2137'
            '506416d7ce128410517c77753a5e0ccab4783f13061fd1f724a92a5de08d1244') 

package() {
  cd "$srcdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
