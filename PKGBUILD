# Maintainer: piernov <piernov@piernov.org>

pkgname=python-intel-jtag-uart
pkgver=0.0.3
pkgrel=1
pkgdesc="Package to interact with JTAG UART modules in Intel FPGA designs"
arch=('any')
url="https://github.com/tomverbeure/intel_jtag_uart"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/i/intel_jtag_uart/intel_jtag_uart-$pkgver.tar.gz")
md5sums=('005e564d6f971f0ece4db59141990feb')

build() {
  cd "$srcdir"/intel_jtag_uart-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/intel_jtag_uart-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
