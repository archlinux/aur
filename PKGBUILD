# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2024.2
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL-2.0-or-later AND Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  # libraries with referenced hooks that work with tests
  'python-boto3'
  'python-pygraphviz'
  'python-pycparser'
  'python-pytest'
  'python-pyusb'
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-uvloop'
  'python-importlib-metadata'
  'python-importlib_resources'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('46ccb6a043054f7b7b4409850881ab4254b7b35f50e6ecd5b324a958f83fc2ff')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
