# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tuifimanager
_name=TUIFIManager
pkgver=2.3.4
pkgrel=1
pkgdesc="A cross-platform terminal-based termux-oriented file manager"
arch=('any')
url="https://github.com/GiorgosXou/TUIFIManager"
license=('GPL3')
depends=('python' 'python-send2trash' 'python-uni-curses')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4a552aae13a74ad6a62ec9bff38456697f1e8c552257ea0ab4a20a604c9451cd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
