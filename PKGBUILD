# Contributor: Oskari Rauta <oskari.rauta@gmail.com>
# Maintainer: Oskari Rauta
pkgname=('python-pytyle3-git' 'python2-pytyle3-git')
pkgver=20150519
pkgrel=1
pkgdesc="An automatic tiler that is compatible with Openbox Multihead"
arch=('any')
url="http://burntsushi.net/X11/pytyle"
license=('GPL')
groups=()
makedepends=('git')
source=('git://github.com/BurntSushi/pytyle3.git' 'setup3.py')
noextract=()
install=pytyle3.install
md5sums=('SKIP' '9d29a233ad59473d1a575fb60f45fc75')

package_python-pytyle3-git() {
  depends=('python' 'python-xpybutil')

  cd "$srcdir/pytyle3"
  rm -f setup3.py
  cp "$srcdir/setup3.py" .
  python setup3.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || return 1
}

package_python2-pytyle3-git() {
  pkgdesc+=" (Python2.x)"
  depends=('python2>=2.7' 'xpybutil-git')

  cd "$srcdir/pytyle3"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || return 1
}
