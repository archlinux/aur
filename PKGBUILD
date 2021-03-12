# Maintainer: Dylan14 <dylan1496 at live dot com>

pkgname=python-pykeops
pkgver=1.4.2
pkgrel=1
pkgdesc="Python bindings for the cpp/cuda library KeOps."
arch=('x86_64')
url="http://www.kernel-operations.io/keops/index.html"
license=('MIT')
depends=('python' 'python-numpy' 'gcc>=7.0.0' 'cmake' 'cuda' 'python-pytorch>=1.5.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/18/5a/896032f7ab0bf6eee12af5373aa714bbf4e58314684c04e8c17a6a5e4914/pykeops-$pkgver.tar.gz")
sha256sums=('21c3f6bcf44f737703f1b1ff5f888e3a837eb79315f2594b344eeffca3a7640b')

_pkgname=pykeops

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir"/ --optimize=1
}