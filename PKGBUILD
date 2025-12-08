# Maintainer: Dylan14 <dylan1496 at live dot com>

pkgname=python-pykeops
pkgver=2.3
pkgrel=1
pkgdesc="Python bindings for the cpp/cuda library KeOps."
arch=('x86_64')
url="http://www.kernel-operations.io/keops/index.html"
license=('MIT')
depends=('python' 'python-numpy' 'gcc>=7.0.0' 'cmake' 'cuda' 'python-pytorch>=1.5.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/3b/e1/3bb0af9916632e712cc0b0326679647d7452e626811dbc2b15b277add460/pykeops-2.3.tar.gz")
sha256sums=('458fa77985efd2161be9c719e8dd41e495526cd735d3262aec09902505f5bdba')

_pkgname=pykeops

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir"/ --optimize=1
}
