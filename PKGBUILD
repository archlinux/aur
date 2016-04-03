# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgbase="python-whelk"
pkgname=("python2-whelk" "python-whelk")

pkgver=2.6
pkgrel=1
pkgdesc="A python library to run shell commands"
url="https://github.com/seveas/whelk"
arch=('any')
license=('GPLv3')
depends=('python' 'python2')
makedepends=('git')
source=("git+https://github.com/seveas/whelk.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/whelk"
  python setup.py build
  python2 setup.py build
}

package_python-whelk() {
  depends=('python')
  provides=('python-whelk')
  conflicts=('python-whelk')
  cd "$srcdir/whelk"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

package_python2-whelk() {
  depends=('python2')
  provides=('python2-whelk')
  conflicts=('python2-whelk')
  cd "$srcdir/whelk"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
