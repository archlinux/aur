# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-liblarch-git
pkgver=v0.1.r114.g3ea294a
pkgrel=2
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/liblarch"
license=('LGPL3')
depends=('python' 'python-gobject')
optdepends=()
makedepends=('git' 'python' 'python-distribute')
checkdepends=('python-nose')
provides=('python-liblarch')
conflicts=('python-liblarch')
source=("git://github.com/liblarch/liblarch.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/liblarch"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/liblarch"
  python run-tests
}

build() {

  cd "$srcdir/liblarch"
  python setup.py build
}

package() {
  cd "$srcdir/liblarch"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
