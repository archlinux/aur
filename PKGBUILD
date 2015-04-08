# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>
pkgname=('python-scandir' 'python2-scandir')
pkgdesc="A better directory iterator that returns all file info OS provides"
pkgver=0.9
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/benhoyt/scandir"
license=('BSD')
makedepends=('git')
source=("https://github.com/benhoyt/scandir/archive/v${pkgver}.tar.gz")
md5sums=('999529e7a3dc64fe7c705208e35780a8')
sha256sums=('05f86a67d82d8a919b3eac16efd81509f8447bf9ea5b27be9f354fa2ff08523a')

build() {
  cd "scandir-$pkgver"

  msg2 "Building for Python 3"
  python setup.py build
  msg2 "Building for Python 2"
  python2 setup.py build
}

package_python-scandir() {
  depends=('python')

  cd "scandir-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

package_python2-scandir() {
  depends=('python2')

  cd "scandir-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

# vim:set ts=2 sw=2 et:
