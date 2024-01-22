# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=3.3.5
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL-3.0-or-later')
depends=('python' 'python-send2trash' 'python-uni-curses')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$_name-v.$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('b42f279dc446642cdfda7458bdd8d6f4b1ec5026f2982a8815e99c3385b9ff86')

build() {
  cd "$_name-v.$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v.$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
