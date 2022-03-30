# Maintainer: Dylan14 <dylan1496 at live dot com>

pkgname=python-pykeops
pkgver=2.0
pkgrel=1
pkgdesc="Python bindings for the cpp/cuda library KeOps."
arch=('x86_64')
url="http://www.kernel-operations.io/keops/index.html"
license=('MIT')
depends=('python' 'python-numpy' 'gcc>=7.0.0' 'cmake' 'cuda' 'python-pytorch>=1.5.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/dd/45/f15412a8bc3f9cf8b6def596e53dba5a39a3229e4956968fdf582902d26c/pykeops-$pkgver.tar.gz")
sha256sums=('2766a607c2df45fdebb717153fd8efa4296251d081abdd4fa3fabe6708d5925b')

_pkgname=pykeops

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir"/ --optimize=1
}
