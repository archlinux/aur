# Maintener Théophane Hufschmitt <theophane.hufschmitt@gmx.fr>
pkgname=topydo-git
_gitname=topydo
pkgver=0.9.r4.g19b5623
pkgrel=1
pkgdesc="topydo is a todo list application using the todo.txt format."
arch=("any")
url="https://github.com/bram85/topydo"
license=('GPLv3')
depends=("python" "python-setuptools" "python-six" "python-arrow")
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
