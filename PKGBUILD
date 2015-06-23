# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>
pkgname=('python-scandir' 'python2-scandir')
pkgdesc="A better directory iterator that returns all file info OS provides"
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/benhoyt/scandir"
license=('BSD')
makedepends=('git')
source=("https://pypi.python.org/packages/source/s/scandir/scandir-${pkgver}.tar.gz")
md5sums=('6b6b777bcc119429e8f86bfe54be2635')
sha256sums=('3a3be7a7ef07f59731a084832f231032fd87df6200e6a703695ac1832b190d28')

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
