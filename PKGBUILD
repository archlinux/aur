# Maintainer: sudokode <sudokode@gmail.com>

pkgname=python-netifaces-git
pkgver=1.0.0.r6.098dfda
pkgrel=1
pkgdesc="Portable module to access network interface information in Python 3"
arch=('i686' 'x86_64')
url="https://github.com/kelleyk/py3k-netifaces"
license=('MIT')
depends=('python')
makedepends=('git' 'python-distribute')
source=("$pkgname::git://github.com/kelleyk/py3k-netifaces.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  python setup.py install --root "$pkgdir"

  install -Dm644 README "$pkgdir"/usr/share/python-netifaces/README
  install -Dm644 README "$pkgdir"/usr/share/licenses/python-netifaces/LICENSE
}

# vim:set ts=2 sw=2 et:
