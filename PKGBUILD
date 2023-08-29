# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=topydo-git
_gitname=topydo
pkgver=0.14.r19.gf3dc108
pkgrel=1
pkgdesc="topydo is a todo list application using the todo.txt format."
arch=("any")
url="https://github.com/bram85/topydo"
license=('GPLv3')
depends=("python" "python-setuptools" "python-arrow" "python-urwid" "python-watchdog" "python-prompt_toolkit")
provides=("topydo")
source=("git+https://github.com/bram85/topydo.git")
md5sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_gitname
  python setup.py build
  python setup.py install --root=$pkgdir
}
