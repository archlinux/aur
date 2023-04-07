# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nose-fixes
pkgver=1.3
pkgrel=7
pkgdesc="A plugin to make nose behave better"
arch=('any')
url="https://github.com/cjw296/nose_fixes"
license=('LGPL')
depends=('python-nose')
makedepends=('python-setuptools' 'git')
checkdepends=('python-testfixtures')
source=("git+https://github.com/cjw296/nose_fixes.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/nose_fixes"
  python setup.py build
}

check() {
  cd "$srcdir/nose_fixes"
  nosetests3
}

package() {
  cd nose_fixes
  python setup.py install --root="${pkgdir}" --optimize=1
}
