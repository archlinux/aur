# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=3.3.1
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL3')
depends=('python' 'python-send2trash' 'python-uni-curses')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$_name-v.$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('0859bd643454ea59efe31b528d810d1de2c4bc207cd143d2221e31d418188c15')

build() {
  cd "$_name-v.$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v.$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
