# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname="python2-pyinsane-git"
_pkgname="pyinsane"
pkgver=2.0.2.r2.g78784de
pkgrel=1
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer."
arch=('any')
url="https://github.com/jflesch/pyinsane"
license=('GPL3')
makedepends=('python2' 'git' 'python2-setuptools')
optdepends=( 'python2-pillow')
provides=('python2-pyinsane')
conflicts=('python2-pyinsane')
changelog='ChangeLog'
source=('git+http://github.com/jflesch/pyinsane')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}
