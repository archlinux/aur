# Maintainer: Mark Collins <tera_1225 hat hotmail dot com>

pkgname=onionshare-cli
pkgver=2.6.3
pkgrel=1
pkgdesc="Share files, host websites, and chat with friends using Tor (CLI version)"
url="https://github.com/onionshare/onionshare/tree/main/cli"
arch=('any')
license=('GPL-3.0-only')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
depends=(
  'python'
  'python-colorama'
  'python-flask'
  'python-flask-compress'
  'python-flask-socketio'
  'python-packaging'
  'python-psutil'
  'python-pynacl'
  'python-qrcode'
  'python-requests'
  'python-stem'
  'python-unidecode'
  'python-waitress'
  'python-werkzeug'
  'tor'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('077971cd227ff5fcc2080f7ae58aebb1fbfb3217313ab0e89f603e9b97459368')

build() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
