# Maintainer: piernov <piernov@piernov.org>

pkgname=python-qualia-codegen-plugin-snn
pkgver=2.5.0
pkgrel=1
pkgdesc="Support for Spiking Neural Networks in Qualia-CodeGen"
arch=('any')
url="https://github.com/LEAT-EDGE/qualia-codegen-plugin-snn"
license=('AGPL-3.0')
depends=('python' 'python-numpy' 'python-qualia-codegen-core' 'python-spikingjelly' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("git+https://github.com/leat-edge/qualia-codegen-plugin-snn.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir"/qualia-codegen-plugin-snn
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/qualia-codegen-plugin-snn
  python -m installer --destdir="$pkgdir" dist/*.whl
}
