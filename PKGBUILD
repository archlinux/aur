# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=sigpy
pkgname=${_name}
pkgver=0.1.22
pkgrel=1
pkgdesc="A package for signal processing, with emphasis on iterative methods."
arch=('any')
url="https://github.com/mikgroup/sigpy"
license=('BSD')
depends=('python>=3.5' 'python-tqdm' 'python-numpy' 'python-numba' 'python-pywavelets')
makedepends=('python-setuptools')
optdepends=('python-cupy: CUDA support' 'python-matplotlib: plotting' 'python-mpi4py: MPI support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/mikgroup/${pkgname}/master/LICENSE")
sha256sums=('e9ff5aa47bef18390ccbe9237bb3b18d358095d3a81f7c6270b776364ede76a2'
            '506416d7ce128410517c77753a5e0ccab4783f13061fd1f724a92a5de08d1244')

package() {
  cd "$srcdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
