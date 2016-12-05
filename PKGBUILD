# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=topydo-git
_gitname=topydo
pkgver=0.10.1.r71.g6383df7
pkgrel=1
pkgdesc="topydo is a todo list application using the todo.txt format."
arch=("any")
url="https://github.com/bram85/topydo"
license=('GPLv3')
depends=("python" "python-setuptools" "python-six" "python-arrow" "python-urwid" "python-watchdog")
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
