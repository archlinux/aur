# Maintainer: Dylan14 <dylan1496 at live dot com>

pkgname=python-pykeops
pkgver=2.1.2
pkgrel=1
pkgdesc="Python bindings for the cpp/cuda library KeOps."
arch=('x86_64')
url="http://www.kernel-operations.io/keops/index.html"
license=('MIT')
depends=('python' 'python-numpy' 'gcc>=7.0.0' 'cmake' 'cuda' 'python-pytorch>=1.5.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/40/b5/076d3ff0070d011a8e04210cf7851450e8063d5f01926d7f0ecdc6edeefc/pykeops-2.1.2.tar.gz")
sha256sums=('5d7ebe2d39534253e88da970d420f10b00e76c599b31fc495884d017c15f6a85')

_pkgname=pykeops

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir"/ --optimize=1
}
