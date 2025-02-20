# Maintainer: piernov <piernov@piernov.org>

pkgname=python-qualia-codegen-core
pkgver=2.5.0
pkgrel=1
pkgdesc="Convert a pre-trained Keras .h5 or PyTorch model to C code for inference."
arch=('any')
url="https://github.com/LEAT-EDGE/qualia-codegen-core"
license=('AGPL-3.0')
depends=('python' 'python-numpy' 'python-jinja' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
optdepends=('python-keras: support for code generation from Keras models'
            'python-pytorch: support for code generation from PyTorch models'
            'python-graphviz: plot model graph')
source=("git+https://github.com/leat-edge/qualia-codegen-core.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir"/qualia-codegen-core
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/qualia-codegen-core
  python -m installer --destdir="$pkgdir" dist/*.whl
}
