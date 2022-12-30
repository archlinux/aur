# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=2.1.9
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL3')
depends=('python' 'python-send2trash' 'python-uni-curses')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18a13921754436f3397e1eb1fc8cf2d6a35f46732590bc19cfe2e7014795a0a3')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
