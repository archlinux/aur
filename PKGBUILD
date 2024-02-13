# Maintainer: Dylan14 <dylan1496 at live dot com>

pkgname=python-pykeops
pkgver=2.2.2
pkgrel=1
pkgdesc="Python bindings for the cpp/cuda library KeOps."
arch=('x86_64')
url="http://www.kernel-operations.io/keops/index.html"
license=('MIT')
depends=('python' 'python-numpy' 'gcc>=7.0.0' 'cmake' 'cuda' 'python-pytorch>=1.5.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/4f/db/bc39837ce6b9bf58bc2669b0f168ca104d6438d32011389976a1bf371c73/pykeops-2.2.2.tar.gz")
sha256sums=('fbcda3822b153eb0e112a8babc0202e3df36ab73252a5d0fc610a91221de3ac4')

_pkgname=pykeops

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir"/ --optimize=1
}
