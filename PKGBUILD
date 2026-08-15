# Maintainer: Lucas Sanchez Sagrado <lucsansag@gmail.com>

pkgname=python-webrepl
pkgver=0.2.0
pkgrel=1
pkgdesc='Python module to handle micropython websocket (WS) repl protocol (client side only)'
arch=('any')
url='https://github.com/kost/webrepl-python'
license=('MIT')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ac697a57977b4c84ed0589f93b284abce333e5583a468c3bc26eb0d0ce972a0')

build() {
  cd "${srcdir}/webrepl-python-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/webrepl-python-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
