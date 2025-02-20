# Maintainer: piernov <piernov@piernov.org>

pkgname=python-qualia-plugin-snn
pkgver=2.5.0
pkgrel=1
pkgdesc="Support for Spiking Neural Networks in Qualia"
arch=('any')
url="https://github.com/LEAT-EDGE/qualia-plugin-snn"
license=('AGPL-3.0')
depends=('python' 'python-numpy' 'python-qualia-core' 'python-pytorch' 'python-spikingjelly' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
optdepends=('python-qualia-codegen-plugin-snn: support for deployment using Qualia-CodeGen C code generation tool')
source=("git+https://github.com/leat-edge/qualia-plugin-snn.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir"/qualia-plugin-snn
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/qualia-plugin-snn
  python -m installer --destdir="$pkgdir" dist/*.whl
}
