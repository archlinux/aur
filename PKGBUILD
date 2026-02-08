# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=5.2.6
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL-3.0-or-later')
depends=(
  'pyside6'
  'python'
  'python-pynput'
  'python-requests'
  'python-send2trash'
  'python-uni-curses'
  'python-xlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('6adbfbe6779fbfb62fe259f09273be4ba8aa1688f9e654066b39caf676d331db')

build() {
  cd "$_name-v.$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v.$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
