# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=sigpy
pkgname=${_name}
pkgver=0.1.23
pkgrel=2
pkgdesc="A package for signal processing, with emphasis on iterative methods."
arch=('any')
url="https://github.com/mikgroup/sigpy"
license=('BSD')
depends=('python>=3.5' 'python-tqdm' 'python-numpy' 'python-numba' 'python-pywavelets' 'python-scipy')
makedepends=('python-setuptools')
optdepends=('python-cupy: CUDA support' 'python-matplotlib: plotting' 'python-mpi4py: MPI support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/mikgroup/${pkgname}/master/LICENSE")
sha256sums=('cf736b8c63c2c69da6d9fa1aec0c8e9d748419c260c371870155a83e6aca59b0'
            '506416d7ce128410517c77753a5e0ccab4783f13061fd1f724a92a5de08d1244')

package() {
  cd "$srcdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
