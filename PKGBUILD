# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=python-jsonrpclib-pelix
pkgver=1.2.0
pkgrel=1
pkgdesc="JSON-RPC v2.0 client and server, usable with Pelix/iPOPO remote services"
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
url="https://github.com/tcalmant/jsonrpclib"
license=('Apache-2.0')
source=(https://files.pythonhosted.org/packages/source/j/jsonrpclib-pelix/jsonrpclib_pelix-$pkgver.tar.gz)
sha256sums=('353b66707c0fc4263edc8fd6bbd471b7aede823a83e4dbf1614b0c83aee20f18')

build() {
  cd "jsonrpclib_pelix-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "jsonrpclib_pelix-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
