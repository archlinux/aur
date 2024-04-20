# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=4.0.0
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL-3.0-or-later')
depends=('python' 'python-send2trash' 'python-uni-curses')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33fe269fad27de99ce2145267d0d5d047117379d451ccb78fdb75426c99a96fc')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
