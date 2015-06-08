# Maintener Théophane Hufschmitt <theophane.hufschmitt@gmx.fr>
pkgname=topydo-git
_gitname=topydo
pkgver=0.2.r0.g503d876
pkgrel=1
pkgdesc="A couple of tools (actions, filters, sorting) for todo.txt files"
arch=("any")
url="https://github.com/bram85/topydo"
license=('GPLv3')
depends=("python2")
provides=("topydo")
source=("git+https://github.com/bram85/topydo.git")
md5sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_gitname
  python2 setup.py build
  python2 setup.py install --root=$pkgdir
}
