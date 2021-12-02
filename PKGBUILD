# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-genty
pkgver=1.3.2
pkgrel=10
pkgdesc="Allows you to run a test with multiple data sets"
arch=('any')
license=('Apache')
url="https://github.com/box/genty"
depends=('python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('python-mock')
source=("git+https://github.com/box/genty.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/genty"
  python setup.py build
}

check() {
  cd "$srcdir/genty"
  python setup.py test
}

package() {
  cd genty
  python setup.py install --root="${pkgdir}" --optimize=1
}
